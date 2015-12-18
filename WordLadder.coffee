# Given two words and a dictionary, find the length of the shortest transformation
# sequence from start to end such that only one letter can be changed at a time.

wordLadder = (first, last, dictionary) ->
    # must count the first word
    1 + wordLadderExecution first, last, dictionary

wordLadderExecution = (first, last, dictionary) ->
    copyDic = JSON.parse JSON.stringify dictionary # gambiarra do JS

    return 1 if differentLetters(first, last) is 1
    
    nextWordPossibilities = copyDic.filter (value) ->
        return differentLetters(first,value) is 1

    depths = nextWordPossibilities.map (value) ->
        newDict = JSON.parse JSON.stringify copyDic # gambiarra do JS
        newDict.splice copyDic.indexOf(value), 1
        wordLadderExecution value, last, newDict

    return min(depths) + 1

min = (array) ->
    val = array.reduce (last, current) ->
        val = if current < last then current else last
        return last
    return val

differentLetters = (word1, word2) ->
    a1 = word1.split ""
    a2 = word2.split ""
    a1.reduce (value, current, index) ->
        value += 1 if current isnt a2[index]
        return value
    , 0

console.log wordLadder "hit", "cog", ["hot","dot","dog","lot","log"]
console.log 5

console.log wordLadder "hi", "ho", []
console.log 2