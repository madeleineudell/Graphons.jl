# Compute graph statistics
export sample, edge_density, degree_distribution

## Graph statistics on concrete graphs

function sample(A::Array{Float64,2}, nsamples::Int)
    @assert size(A,1) == size(A,2)
    n = size(A,1)
    indices = (1:n)[int(ceil(n*rand(nsamples)))]
    return A[indices, indices]
end

function edge_density(A::AbstractArray)
    return mean(A)
end

function degree_distribution(A::AbstractArray)
    # sorted normalized degrees
    sort(vec(sum(A,1)/size(A,1)))
end 

## Graph statistics on graphons

degree_distribution(g::Graphon, k::Int) = degree_distribution(sample(g, k))
edge_density(g::Graphon, k::Int) = edge_density(sample(g, k))