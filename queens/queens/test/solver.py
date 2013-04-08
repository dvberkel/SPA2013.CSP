import unittest

from queens.solver import Solver

class testSolver(unittest.TestCase):
    def testSolutionFor1(self):
        solutions = Solver().solve(1)

        self.assertEquals(1, len(solutions))
        self.assertEquals([0], solutions[0])

    def testSolutionFor2(self):
        solutions = Solver().solve(2)

        self.assertEquals(0, len(solutions))

    def testSolutionFor3(self):
        solutions = Solver().solve(3)

        self.assertEquals(0, len(solutions))

    def testSolutionFor4(self):
        solutions = Solver().solve(4)

        self.assertEquals(2, len(solutions))
        self.assertTrue([1, 3, 0, 2] in solutions)
        self.assertTrue([2, 0, 3, 1] in solutions)

if __name__ == '__main__':
    unittest.main()
