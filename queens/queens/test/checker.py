import unittest

from queens.solver import Checker

class testChecker(unittest.TestCase):
    def testValidCandidates(self):
        checker = Checker()

        for candidate in [[], [0], [0, 2], [0,3,1], [1, 3, 0, 2]]:
            self.assertTrue(checker.check(candidate))

    def testInvalidCandidates(self):
        checker = Checker()

        for candidate in [[0, 0], [0, 1], [0, 2, 0], [0, 2, 1], [0, 2, 2], [0, 2, 3]]:
            self.assertFalse(checker.check(candidate))

if __name__ == '__main__':
    unittest.main()
