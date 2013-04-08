class Solver:
    def __init__(self):
        pass

    def solve(self, n):
        results = []
        for solution in solutionGenerator(n):
            results.append(solution[:])

        return results

def solutionGenerator(n):
    checker, candidate = Checker(), [0 for i in range(n)]
    while(len(candidate) <= n):
        if (checker.check(candidate)):
            yield candidate[:]
        candidate = nextCandidate(candidate, n)

def nextCandidate(candidate, n):
    result, index  = candidate[:], 0
    if (index < len(result)):
        result[index] += 1
    else:
        result.append(0)
    while (index < len(result) and result[index] == n):
        result[index] = 0;
        index += 1
        if (index < len(result)):
            result[index] += 1
        else:
            result.append(0)

    return result

class Checker:
    def __init__(self):
        pass

    def check(self, candidate):
        if (len(candidate) <= 1):
            return 1
        else:
            row = candidate[0]
            if (row in candidate[1:]):
                return 0
            for index in range(1, len(candidate)):
                if (abs(candidate[index] - row) == index):
                    return 0
            return self.check(candidate[1:])

