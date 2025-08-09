using Pkg
Pkg.activate(".")
Pkg.instantiate()
# Run tests with deprecation warnings as errors
ENV["JULIA_DEPWARN"] = "error"
include("test/runtests.jl")