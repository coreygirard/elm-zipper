import os
from pprint import pprint
import json
import subprocess


def get_filepaths():
    out = []
    for a, b, c in os.walk("src"):
        for c_ in c:
            out.append(os.path.join(a, c_))
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
                table[header][function].append(
                    (filepath, signatures.get((filepath, function), "[ERROR]"))
                )
    return table


def get_file_signatures(filepath):
    out = subprocess.check_output(
        f"cat {filepath} | rosie --file rosie/rosie.rpl grep elmdocs.function_signature --wholefile --output json",
        shell=True,
    )
    return json.loads(out)["subs"]


def get_signature_data():
    table = {}
    for filepath in get_filepaths():
        data = get_file_signatures(filepath)
        for elem in data:
            name, type_ = elem["subs"]
            slug = (filepath, name["data"])
            table[slug] = type_["data"]
    return table


def to_markdown_function(name, locations):
    yield "### " + name + "\n"
    yield f"| filepath | signature |\n"
    yield f"| :--- | :--- |\n"
    for location, type_ in sorted(locations):
        yield f"| [{location}]() | `{type_}` |\n"


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
