import StatsBase: sample, WeightVec

export SBM, sample

type SBM <: Graphon
    alpha::Array{Float64,1}
    P::Array{Float64,2}
#     function SBM(alpha::Array{Float64,1}, P::Array{Float64,2})
#         assert(size(P,1)==size(P,2))
#         assert(P==P')
#         assert(length(alpha)==size(P,1))
#         assert(max(P)<=1)
#         assert(min(P)>=0)
#         assert(sum(alpha)==1)
#         assert(alpha>=0)
#         return new(alpha, P)
#     end
end
function SBM(n::Int)
    alpha = rand(n)
    alpha /= sum(alpha)
    P = symmetrize!(rand(n,n))
    return SBM(alpha, P)
end
function SBM(alpha::Array{Float64,1})
    alpha /= sum(alpha)
    n = length(alpha)
    P = symmetrize!(rand(n,n))
    return SBM(alpha,P)
end
function SBM(P::Array{Float64,2})
    n = size(P,1)
    alpha = ones(n)/n
    return SBM(alpha,P)
end

## Sampling

function sample(sbm::SBM, nsamples::Int)
    n = length(sbm.alpha)
    indices = sample([1:n], WeightVec(sbm.alpha), nsamples)
    R = symmetrize!(rand(nsamples, nsamples))
    A = int(R .<= sbm.P[indices, indices])
    # remove self loops
    for i=1:n
        A[i,i] = 0
    end
    return A
end 