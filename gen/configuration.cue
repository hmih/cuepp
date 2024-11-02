package gen

import (
    "github.com/hmih/hofpp/schema"
    hof "github.com/hofstadter-io/hof/schema/gen"
)

Configuration: hof.Generator & {
    Input: schema.#Input
    In: {
        GLOBAL: schema.#Global
    }
    Outdir: string | *"./out"
    Templates: [...Templates] | *[Templates & {Globs: ["./templates/**/*"], TrimPrefix: "./templates/"}]
    Partials: [...Templates] | *[Templates & {Globs: ["./partials/**/*"], TrimPrefix: "./partials/"}]
    Statics: [...Statics] | *[Statics & {Globs: ["./static/**/*"], TrimPrefix: "./static/"}]

}
