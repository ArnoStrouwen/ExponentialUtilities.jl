#!/usr/bin/env julia

# Simple local test to check for deprecations
println("Testing for deprecations locally...")

# Set up environment
using Pkg
Pkg.activate(".")

# Enable deprecation errors
ENV["JULIA_DEPWARN"] = "error"

println("Loading ExponentialUtilities...")
using ExponentialUtilities

println("Running a simple test...")
A = [1.0 2.0; 3.0 4.0]
result = exponential!(copy(A))
println("Simple test passed!")

println("Running basic tests...")
include("test/basictests.jl")

println("All tests completed successfully!")