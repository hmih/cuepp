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
    [filename=string]: {
        [definition=string]: #configuration & { name: definition }
    }
}

#global: {
    readValuesAtRuntime: bool | *false
    defaultIncludes: [...string] | *["vector", "string", "cstdint"]
}

#file: {
    filename: string
    content: string
}

#configurationType: *"struct" | "enum"

#configuration: {
    name: string
    namespace: string
    type: #configurationType
    includes: [...#include]
    fields: [...#field]
}

#include: {
    name: string
    local: bool | *true
    guard: string
}

#field: {
    name: string
    type?: string
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
