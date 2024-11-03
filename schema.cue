package cuepp

#generator: {
    global: #global
    input: #input
    templates: #template
    output: [...#file]
}

#template: {
    [name=string]: string
}

#input: {
    [filename=string]: #configuration & { name: filename }
}

#global: {
    readValuesAtRuntime: bool | *false
    defaultIncludes: [...string] | *["vector", "string", "cstdint"]
}

#file: {
    filename: string
    content: string
}

#configuration: {
    name: string
    namespace: string
    type: *"struct" | "enum"
    includes: [...#include]
    fields: [...#field]
}

#include: {
    name: string
    local: bool | *true
    guard: string | *""
}

#field: {
    name: string
    type: string
    literal: #literalString | #literalNumber | *null
}

#literalString: {
    value: string
    quote: bool | *true
}

#literalNumber: {
    value: int | float
    quote: bool | *false
}
