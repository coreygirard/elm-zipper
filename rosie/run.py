import os
from pprint import pprint
import json
import subprocess
import re


def get_filepaths():
    out = []
    for a, b, c in os.walk("src"):
        for c_ in c:
            out.append(os.path.join(a, c_))

    out = [
        "src/Zipper/ListList.elm",
        "src/Zipper/ListList/Extra.elm",
        "src/Zipper/ListListList.elm",
        "src/Zipper/ListListList/Extra.elm",
        "src/Zipper/ListElemList.elm",
        "src/Zipper/ListElemList/Extra.elm",
    ]

    return out


def remove_e_and_s(data):
    if type(data) == type({1: 1}):
        return {k: (remove_e_and_s(v)) for k, v in data.items() if k not in ["e", "s"]}
    if type(data) == type([]):
        return [remove_e_and_s(elem) for elem in data]
    return data


def get_file_outline(filepath):
    out = subprocess.check_output(
        f"cat {filepath} | rosie --file rosie/rosie.rpl grep elmdocs.outline_section --wholefile --output json",
        shell=True,
    )
    return json.loads(out)["subs"]


def get_outline_data(signatures):
    table = {}
    for filepath in get_filepaths():
        data = get_file_outline(filepath)
        data = [elem["subs"] for elem in data]
        data = [
            (
                elem[0]["data"],
                [e["data"] for e in elem[1]["subs"]],
            )
            for elem in data
        ]
        for header, functions in data:
            if header not in table:
                table[header] = {}
            for function in functions:
                if function not in table[header]:
                    table[header][function] = []
                line_num, type_ = signatures.get((filepath, function), (-1, "[ERROR]"))
                table[header][function].append((filepath, line_num, type_))
    return table


def get_file_signatures(filepath):
    out = subprocess.check_output(
        f"cat {filepath} | rosie --file rosie/rosie.rpl grep elmdocs.function_signature --wholefile --output json",
        shell=True,
    )
    return json.loads(out)["subs"]


def get_newline_indexes(filepath):
    with open(filepath, "r") as f:
        text = f.read()
    return [i for i, e in enumerate(text) if e == "\n"]


def calc_line_number(indexes, n):
    return len([i for i in indexes if i <= n]) + 1  # empirically derived


def get_signature_data():
    table = {}
    for filepath in get_filepaths():
        print(filepath)
        newline_indexes = get_newline_indexes(filepath)
        data = get_file_signatures(filepath)
        for elem in data:
            elem = elem["subs"][0]
            name, type_ = elem["subs"]
            slug = (filepath, name["data"])
            line_num = calc_line_number(newline_indexes, elem["subs"][0]["s"])
            table[slug] = (line_num, type_["data"])
    return table


def to_markdown_function(name, locations):
    yield "### " + name + "\n"
    yield f"| filepath | signature |\n"
    yield f"| :--- | :--- |\n"
    for location, line_num, type_ in sorted(locations):
        location = location[4:]  # remove 'src/'
        if line_num == -1:
            line_link = "/"
        else:
            line_link = f"https://github.com/coreygirard/elm-zipper/blob/main/src/{location}#L{line_num}"
        type_ = re.sub("[\n ]+", " ", type_)
        yield f"| [{location}]({line_link}) | `{type_}` |\n"


def to_markdown_section(header, body):
    yield "# " + header + "\n\n"

    for key in sorted(body.keys()):
        yield from to_markdown_function(key, body[key])
        yield "\n"


def to_markdown_helper(table):
    for key in sorted(table.keys()):
        yield from to_markdown_section(key, table[key])
        yield "\n\n\n"


def to_markdown(table):
    return "".join(list(to_markdown_helper(table)))


if __name__ == "__main__":
    signatures = get_signature_data()
    table = get_outline_data(signatures)
    with open("./rosie/output.md", "w") as f:
        f.write(to_markdown(table))
