//: Playground - noun: a place where people can play

import UIKit

var sum = 0

for i in 1...100{
    if i%2 != 0{
        print(i,terminator:" ")
    }
}
print("\n")

for i in 1...100{
    if i%2 != 0{
        sum += i
        print(sum,terminator:" ")
    }
}

