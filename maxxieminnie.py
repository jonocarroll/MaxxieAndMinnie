import itertools

def swap(x, t):
    y = x.copy()
    i, j = t
    y[i], y[j] = y[j], y[i]
    return y

def minmax(num): 
    nums = [int(i) for i in str(num)]
    opts = itertools.combinations(range(len(nums)), 2)
    new = map(lambda x: swap(nums, x), list(opts))
    keeps = list(filter(lambda x: x[0] != 0, new))
    keeps.append(nums)
    vals = list(map(lambda x: int(''.join(map(str, x))), keeps))
    return (max(vals), min(vals))

minmax(213)
minmax(12345)
minmax(100)
minmax(11321)
