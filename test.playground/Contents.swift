import Foundation

func pad(string : String, toSize: Int) -> String {
  var padded = string
  for _ in 0..<(toSize - string.count) {
    padded = "0" + padded
  }
    return padded
}

//16 to 10
let h2 = "1d"
let d4 = Int(h2, radix: 16)!
print(d4)

//10 to 16
let d3 = 132
let h1 = String(d3, radix: 16)
print(h1)

//16 to 2
let h4 = "01"
let b4 = String(Int(h4, radix: 16)!, radix: 2)
print(b4) // "1111101011001110"

// 10 to 2
let d1 = 164
let b1 = String(d1, radix: 2)
print(b1) // "10101"

// 2 to 10
let b2 = "1111100"
let d2 = Int(b2, radix: 2)!
print(d2) // 22


//L-вектор для реализации R-преобразования

var lVector: [UInt8] = [
    1, 148, 32, 133, 16, 194, 192, 1,
    251, 1, 192, 194, 16, 133, 32, 148
]
var testVector: [UInt8] = [
    0x7E, 0x0C, 0x7D, 0xD8, 0xB6, 0xD8, 0x7D, 0xD8,
    0x77, 0x77, 0x88, 0x6C, 0xD7, 0x6C, 0x88, 0x79
]
//print(testVector)

// массив для хранения итерационных констант С (32) 16 байт каждая
var iterC: [[UInt8]] = Array(
    repeating: Array(repeating: UInt8(0x00), count: 16),
    count: 32
)

//ФУНКЦИЯ УМНОЖЕНИЕ В ПОЛЕ ГАЛУА

// & - ПОБИТОВОЕ И
// ^ - ПОБИТОВОЕ ИЛИ XOR

func multiplicateGaluaField(from a: UInt8, and b: UInt8) -> UInt8 {
    var c: UInt8 = 0
    var hiBit: UInt8
    
    var tempA = a
    var tempB = b
    
    for _ in 0..<8 {
        
        if (tempB & 1) == 1 {
            c ^= tempA
        }
        
        hiBit = tempA & 0x80 // x^8
        tempA <<= 1
        
        if hiBit == 1 {
            tempA ^= 0xc3 // ПОЛИНОМ x^8 + x^7 + x^6 + x + 1
        }
        
        tempB >>= 1
    }
    return c
    
}
//
////ПРЕОБРАЗОВАНИЕ R (умножение + сдвиг)
//func getTransformationR(for state: [UInt8]) -> [UInt8] {
//    var i = 15
//    var a15: UInt8 = 0
//    var intern: [UInt8] = Array(repeating: 0x00, count: 16)
//
//    repeat {
//
//        if i == 0 {
//            intern[15] = state[i]
//        } else {
//            intern[i-1] = state[i] //ДВИГАЕМ БАЙТЫ В СТОРОНУ МЛАДШЕГО РАЗРЯДА
//        }
//
//        a15 ^= multiplicateGaluaField(from: state[i], and: lVector[i])
//        i -= 1
//    } while i >= 0
//
//    //ПИШЕМ В ПОСЛЕДНИЙ БАЙТ РЕЗУЛЬТАТ СЛОЖЕНИЯ
//    intern[15] = a15
//    print(intern)
//    return intern
//}
//
////ПРЕОБРАЗОВАНИЕ L
//func getTransformationL(for inData: [UInt8]) -> [UInt8] {
//    var outData: [UInt8] = Array(repeating: 0x00, count: inData.count)
//    var intern = inData
//    for _ in 0..<16 {
//        intern = getTransformationR(for: intern)
//    }
//    outData = intern
//    return outData
//}
//
//let resultC = getTransformationL(for: [
//    0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
//    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
//])
//print(resultC)

//var result: UInt8 = 0x00
//var temp: UInt8 = 0x00
//var convert: String = ""
//for i in 0...15 {
//    temp = multiplicateGaluaField(from: testVector[i], and: lVector[i])
//    convert = String(temp, radix: 2)
//    print("l(\(i)) = \(pad(string: convert, toSize: 8))")
//    result ^= temp
//}
//print(String(result, radix: 16))
//
//print(String(testVector[0], radix: 16))
//print(pad(string:String(testVector[0], radix: 2), toSize: 8))
//print(pad(string:String(lVector[0], radix: 2), toSize: 8))
//
//temp = multiplicateGaluaField(from: 0b01111110, and: 0b10010100)
//convert = String(temp, radix: 2)
//print("\(pad(string: convert, toSize: 8))")

var a: UInt8 = 148
var b: UInt8 = 148

var result = multiplicateGaluaField(from: a, and: b) //должна быть равна 164

var full: UInt8 = 32
full ^= 164
