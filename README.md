# Graphons

[![Build Status](https://travis-ci.org/madeleineudell/Graphons.jl.svg?branch=master)](https://travis-ci.org/madeleineudell/Graphons.jl)

Graphons is a Julia package for computation with graphons, ie, limits of graph sequences.
It provides a few useful tools for 

	* formulating some simple graphons (like Erdos-Renyi graphons and stochastic block models)
	* sampling concrete graphs (ie, adjacency matrices) from a graphon
	* computing graph statistics on graphons or on concrete graphs

Usage examples can be found in the examples directory.

## Installation

You can install the package from the Julia prompt
```
Pkg.clone("git@github.com:madeleineudell/Graphons.jl.git")
``