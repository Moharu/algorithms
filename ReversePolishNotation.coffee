# rpn: Array -> Number
# Evaluates the reverse polish notation array and returns the result, valid symbols are + - * /
# / should be integer division

rpn = (expression) ->
    reduceFunction = (previous, current) ->
        unless isNaN Number(current)
            previous.push Number(current) 
            return previous
        n1 = previous.pop()
        n2 = previous.pop()
        result = eval("#{n2}#{current}#{n1}")
        result = Math.floor result if current is "/"
        previous.push result
        return previous

    return(expression.reduce reduceFunction, [])[0]


console.log '========='
console.log rpn ["2", "1", "+", "3", "*"]
console.log 9
console.log '========='
console.log rpn ["4", "13", "5", "/", "+"]
console.log 6
console.log '========='