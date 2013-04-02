import unittest

from queens.solver import Solver

class testSolver(unittest.TestCase):
    def testSolution(self):
        solutions = Solver().solve(1)

        self.assertEquals(1, len(solutions))
        self.assertEquals([0], solutions[0])

if __name__ == '__main__':
    unittest.main()
