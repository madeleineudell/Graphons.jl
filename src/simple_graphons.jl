# some simple subtypes of graphons

export erdosrenyi

# erdos renyi graphs
function erdosrenyi(p::Number)
	if p>=0 && p<=1
	    return SBM([1], fill(p,1,1))
	else
		error("connection probability p must be between 0 and 1")
	end
end