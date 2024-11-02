package gen

import (
    "github.com/hmih/hofpp/schema"
    hof "github.com/hofstadter-io/hof/schema/gen"
)

HofPP: hof.Generator & {
    Input: schema.#Input
    In: {
        GLOBAL: schema.#Global
    }
    Outdir: string
}
