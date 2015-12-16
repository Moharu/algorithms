# Given two string S and T, determine if they are ISOMORPHIC
# that means that replacing characters in S can get to T

areIsomorphic = (w1, w2) ->
    r1 = mapWord w1.split("")
    r2 = mapWord w2.split("")
    # compares the arrays
    return r1.every (current, index) ->
        return current is r2[index]

mapWord = (word) ->
    dictionary = {}
    current = 0
    return word.map (letter) ->
        unless dictionary[letter]?
            dictionary[letter] = current
            current += 1
        return dictionary[letter]

console.log areIsomorphic "egg","add"
console.log true
console.log areIsomorphic "foo","bar"
console.log false