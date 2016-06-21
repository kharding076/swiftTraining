//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

for var i = 1; i <= 10; i++ {
    println(i * 5)
}


var arr = [6, 8, 4, 10]

for x in arr {
    println(x)
}


for (index, x) in enumerate(arr) {
    arr[index] = x + 1
}
