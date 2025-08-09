#!/usr/bin/env julia

# Simple test to check for deprecations
using Pkg
Pkg.activate(".")

println("Testing with deprecation warnings as errors...")

# Test just loading the package first
try
    ENV["JULIA_DEPWARN"] = "error"
    using ExponentialUtilities
    println("✅ Package loaded successfully")
    
    # Test basic functionality
    A = [1.0 2.0; 3.0 4.0]
    result = exponential!(copy(A))
    println("✅ Basic functionality works")
    
    # Test a few more functions
    result2 = exponential!(copy(A), ExpMethodHigham2005())
    println("✅ ExpMethodHigham2005 works")
    
    result3 = exponential!(copy(A), ExpMethodGeneric())
    println("✅ ExpMethodGeneric works")
    
    println("✅ All basic tests passed with no deprecations!")
    
catch e
    println("❌ Error encountered:")
    println(e)
    
    # Check if it's a deprecation error
    error_str = string(e)
    if contains(error_str, "deprecated") || contains(error_str, "Deprecation")
        println("\n🔍 This is a deprecation error that needs to be fixed.")
        exit(1)
    else
        println("\n🔍 This is a different type of error.")
        rethrow(e)
    end
end