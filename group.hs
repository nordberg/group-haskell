-- G(*, S) is a group if the four group axioms holds
    -- 1) The set is closed
    -- 2) The set is associative
    -- 3) Every element of the set has an identity element
    -- 4) Every element of the set has an inverse element
isGroup :: (Eq a) => (a -> a -> a) -> [a] -> Bool
isGroup op set = and [(isClosed op set), (isAssoc op set), (hasIdentity op set), (allHasInverse op set)]

-- A set is closed under the binary operation * iff a is in the set, then a * b is also in the set for any b in the set
isClosed :: (Eq a) => (a -> a -> a) -> [a] -> Bool
isClosed op set = and [(x1 `op` x2) `elem` set | x1 <- set, x2 <- set]

-- A set is associative under the binary operation * iff a, b and c are elements in the set, then the assiciative law holds
    -- The associative law: (a * b) * c = a * (b * c)
isAssoc :: (Eq a) => (a -> a -> a) -> [a] -> Bool
isAssoc op set = and [(x1 `op` x2) `op` x3 == x1 `op` (x2 `op` x3) | x1 <- set, x2 <- set, x3 <- set]

-- A set has an identity element iff there is an identity element (id * a == a * id = a) for every element in the set
hasIdentity :: (Eq a) => (a -> a -> a) -> [a] -> Bool
hasIdentity op set = and [x1 `op` x2 == x2 `op` x1 && x1 `op` x2 == x1 | x1 <- set, x2 <- set]

identityOf :: (Eq a) => (a -> a -> a) -> [a] -> a
identityOf op set = head [id | id <- set, x <- set, id `op` x == x `op` id, id == id `op` x]

-- To be a group, all elements of the set has to have an inverse element in the set.
allHasInverse :: (Eq a) => (a -> a -> a) -> [a] -> Bool
allHasInverse op set = and [(hasInverse x op set) | x <- set]

-- An element has an inverse iff there exists an element in the set such that a * inv == inv * a == id
hasInverse :: (Eq a) => a -> (a -> a -> a) -> [a] -> Bool
hasInverse x op set = or [x `op` y == y `op` x && x `op` y == (identityOf op set) | y <- set]