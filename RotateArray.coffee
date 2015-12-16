# Rotate Array: Array[ANY] Number -> Array[ANY]
# rotates an array A by K steps
# rotate(A, K)

rotate = (array, steps) ->
    steps = steps % array.length
    cutIndex = array.length - steps
    return (array.slice cutIndex).concat (array.slice 0, cutIndex)

console.log '======'
console.log rotate([1,2,3], 1)
console.log [3,1,2]
console.log '======'
console.log rotate(['a','b','c','d'], 2)
console.log ['c', 'd', 'a', 'b']
console.log '======'
console.log rotate([1,2,3], 4)
console.log [3,1,2]
console.log '======'