#!/usr/bin/env julia

# Comprehensive test script with deprecation warnings as errors
using Pkg

println("=== Testing ExponentialUtilities with Deprecation Errors ===")

# Activate the project
println("Activating project...")
Pkg.activate(".")

# Install dependencies
println("Installing dependencies...")
Pkg.instantiate()

# Set deprecation warnings to error
println("Setting JULIA_DEPWARN=error...")
ENV["JULIA_DEPWARN"] = "error"

# Test basic package loading
println("\n1. Testing package loading...")
try
    using ExponentialUtilities
    println("✅ Package loaded successfully")
catch e
    println("❌ Package loading failed:")
    println(e)
    exit(1)
end

# Test basic functionality
println("\n2. Testing basic functionality...")
try
    A = [1.0 2.0; 3.0 4.0]
    result = exponential!(copy(A))
    println("✅ Basic exponential operation works")
catch e
    println("❌ Basic functionality test failed:")
    println(e)
    exit(1)
end

# Run the full test suite
println("\n3. Running full test suite...")
try
    include("test/runtests.jl")
    println("✅ All tests passed with no deprecation warnings!")
catch e
    println("❌ Test suite failed:")
    println(e)
    
    # Check if it's a deprecation error
    error_msg = string(e)
    if contains(error_msg, "deprecated") || contains(error_msg, "Deprecation")
        println("\n🔍 This appears to be a deprecation error.")
        println("Error details:")
        println(error_msg)
        exit(1)
    else
        println("\n🔍 This appears to be a different type of error.")
        rethrow(e)
    end
end

println("\n🎉 All tests completed successfully with deprecation errors enabled!")