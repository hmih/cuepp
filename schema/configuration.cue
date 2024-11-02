package schema

#Input: {
    Configurations: [...#Configuration]
}

#Global: {
    readValuesAtRuntime: bool
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
