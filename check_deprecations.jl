#!/usr/bin/env julia

# Quick script to check for deprecations by loading the package
using Pkg
Pkg.activate(".")

println("Loading ExponentialUtilities...")
try
    using ExponentialUtilities
    println("✅ Package loaded successfully")
    
    # Try a simple operation
    A = [1.0 2.0; 3.0 4.0]
    result = exponential!(copy(A))
    println("✅ Basic exponential operation works")
    
catch e
    println("❌ Error loading package or running basic operation:")
    println(e)
end