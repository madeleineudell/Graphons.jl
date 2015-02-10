using Graphons

# sample a graph with 10 nodes from a graphon with equal size groups
println("sample a graph with 10 nodes from a graphon with equal size groups")
k = 5
g = SBM(fill(1/k,k))
A = sample(g, 10)
println(A)

# create an erdos renyi graph with p=.3 
# and find a histogram of its degree distribution
println("create an erdos renyi graph with p=.3 and find a histogram of its degree distribution")
erdos = erdosrenyi(.3)
edge_density(erdos,100)
h = hist(degree_distribution(erdos,100))
println(h)