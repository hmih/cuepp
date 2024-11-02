package gen

import (
    "github.com/hmih/hofpp/schema"
    hof "github.com/hofstadter-io/hof/schema/gen"
)

Configuration: hof.Generator & {
    Input: [...schema.#Configuration]
    In: {
        GLOBAL: schema.#Global
    }
    Outdir: string | *"./out"
}
