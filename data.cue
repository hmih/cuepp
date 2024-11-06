@extern(embed)

package cuepp

import (
    go "text/template"
)

generator: #generator & {
    global: {
        readValuesAtRuntime: true
    }
    input: {
        OneFile: {
            Parent: {
                type: "struct"
                namespace: "cv"
                fields: [
                    {
                        type: "std::string",
                        name: "data",
                        literal: value: "test"
                    },
                    {
                        type: "uint8_t",
                        name: "rows",
                        literal: value: 4
                    },
                ]
            }
            Child: {
                type: "struct"
                namespace: "cv"
                fields: [
                    {
                        type: "std::string",
                        name: "child_data",
                        literal: value: "example"
                    },
                    {
                        type: "uint8_t",
                        name: "columns",
                        literal: value: 8
                    },
                ]
            }
        }
        Second: {
            AnotherOne: {
                type: "enum"
                namespace: "cv"
                fields: [
                    {
                        name: "EXAMPLE",
                        literal: value: 0
                    },
                    {
                        name: "ANOTHER",
                        literal: value: 1
                    },
                ]
            }
        }
    }
    templates: {
        class: string @embed(file="templates/class.go.tmpl", type=text)
    }
    output: [
        for name, definitions in generator.input
            filename: name + ".hpp"
            content: go.Execute(
                templates.class,
                [generator.global, definitions]
            )
        }
    ]
}
