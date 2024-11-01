package gen

import (
    hof "github.com/hofstadter-io/hof/schema/gen"
)

// Generator definition
Configuration: hof.Generator & {
    @gen(hofpp)

    // The server design conforming to the server schema
    Input: schema.Configuration
    // Base output directory, defaults to current
    Outdir: string | *"./out"

    // In & Out fields for hof
    // ------------------------
    // In is passed to every template as the root keys
    In: {
            // a convention for making root keys stand out visually
            SERVER: Server
    }
    // Actual files generated by hof, combined into a single list
    Out: [...gen.File] & _All
}