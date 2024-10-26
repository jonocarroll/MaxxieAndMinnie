using Combinatorics

function swap(x, i, j)
    y = copy(x)
    y[i], y[j] = y[j], y[i]
    y
end

function maxmin(x)
    nvec = parse.(Int64, split(string(x), ""))
    opts = collect(combinations(1:length(nvec), 2))
    new = [[nvec]; map(x -> swap(nvec, x...), opts)]
    keep = filter(x -> x[1] != 0, new)
    vals = parse.(Int64, join.(keep))
    [maximum(vals) minimum(vals)]
end

maxmin(213)
maxmin(12345)
maxmin(100)
maxmin(11321)
