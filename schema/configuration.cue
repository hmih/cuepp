package schema

#Input: {
    Global: #Global
    Configurations: [...#Configuration]
}

#Global: {
    readValuesAtRuntime: bool
    defaultIncludes: ["vector", "string", "cstdint"]
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
    Literal: #Literal
}

#Literal: {
    Value: [v=_]: string | int | *null
    Quote: bool | 
}

#Literal: {
    Quote: if Value is string {
        true
    } else {
        false
    }
}
