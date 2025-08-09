#!/usr/bin/env julia --depwarn=error

# Comprehensive test with deprecation errors enabled from the start
println("=== Comprehensive Test with Deprecation Errors ===")

using Pkg
Pkg.activate(".")

println("Running Pkg.test() with deprecation errors...")
try
    Pkg.test()
    println("✅ All tests passed with no deprecation warnings!")
catch e
    println("❌ Test failed:")
    println(e)
    
    # Analyze the error
    error_str = string(e)
    if contains(error_str, "deprecated") || contains(error_str, "Deprecation")
        println("\n🔍 DEPRECATION ERROR DETECTED:")
        println("This error indicates that deprecated functionality is being used.")
        println("The error needs to be fixed before enabling strict deprecation mode in CI.")
        
        # Try to extract more details
        if isa(e, Base.Meta.ParseError) || isa(e, LoadError)
            println("\nError details:")
            showerror(stdout, e)
        end
        
        exit(1)
    else
        println("\n🔍 This appears to be a non-deprecation error:")
        showerror(stdout, e)
        exit(1)
    end
end