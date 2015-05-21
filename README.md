# Group Theory in Haskell
Determines whether a set together with a binary operation forms a group.

# The Group Axioms
1. Closure, For all a, b in G, the result of the operation, a • b, is also in G.
2. Associativity, For all a, b and c in G, (a • b) • c = a • (b • c).
3. Identity element, There exists an element e in G, such that for every element a in G, the equation e • a = a • e = a holds.
4. Inverse element, For each a in G, there exists an element b in G such that a • b = b • a = e, where e is the identity element.

# Disclaimer
Groups, where the set is limited to numbers, aren't very interesting. The only ones I can come up with are (*, [1]) and (/, [1]). Thus, very limited testing has been conducted. I hope the code is mathematically correct though.