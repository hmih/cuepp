@extern(embed)

package hofpp

Templates: _ @embed(glob=templates/*.go.tmpl,type=text)

#Input: {
    Configurations: [...#Configuration]
}

#Global: {
    readValuesAtRuntime: bool | *false
    defaultIncludes: [...string] | *["vector", "string", "cstdint"]
}

#Configuration: {
    Name: string,
    Includes: [...#Include]
    Fields: [...#Field]
}

#Include: {
    Name: string
    Local: bool | *true
    Guard: string | *""
}

#Field: {
    Name: string
    Type: string
    Literal: #Literal
}

#Literal: {
    Value: string | int | *null
    Quote: bool
}
