import unittest

from queens.solver import nextCandidate

class testNextCandidate(unittest.TestCase):
    def testNextCandidates(self):
        self.assertEqual([0], nextCandidate([], 1))
        self.assertEqual([0, 0], nextCandidate([0], 1))
        self.assertEqual([0, 0, 0], nextCandidate([0, 0], 1))
        self.assertEqual([0], nextCandidate([], 2))
        self.assertEqual([1], nextCandidate([0], 2))
        self.assertEqual([0, 0], nextCandidate([1], 2))
        self.assertEqual([1, 0], nextCandidate([0, 0], 2))
        self.assertEqual([0, 1], nextCandidate([1, 0], 2))
        self.assertEqual([1, 1], nextCandidate([0, 1], 2))
        self.assertEqual([0, 0, 0], nextCandidate([1, 1], 2))
        self.assertEqual([0], nextCandidate([], 3))
        self.assertEqual([1], nextCandidate([0], 3))
        self.assertEqual([2], nextCandidate([1], 3))
        self.assertEqual([0, 0], nextCandidate([2], 3))

if __name__ == '__main__':
    unittest.main()
