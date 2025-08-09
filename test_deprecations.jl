#!/usr/bin/env julia

# Test script to check for deprecations
using Pkg

println("Activating project...")
Pkg.activate(".")

println("Installing dependencies...")
Pkg.instantiate()

println("Running tests with deprecation warnings as errors...")
try
    # Set environment variable to treat deprecations as errors
    ENV["JULIA_DEPWARN"] = "error"
    
    # Load and run tests
    include("test/runtests.jl")
    
    println("✅ All tests passed with no deprecation warnings!")
catch e
    if isa(e, ErrorException) && contains(string(e), "deprecated")
        println("❌ Deprecation error found:")
        println(e)
        rethrow(e)
    else
        println("❌ Test failed with error:")
        println(e)
        rethrow(e)
    end
end