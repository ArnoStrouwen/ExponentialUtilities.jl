#!/bin/bash
# Script to run tests with deprecation warnings as errors
cd /workspace
julia --depwarn=error --project=. -e "using Pkg; Pkg.test()"