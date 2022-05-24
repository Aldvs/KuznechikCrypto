import Foundation
import CryptoKit
//func pad(string : String, toSize: Int) -> String {
//  var padded = string
//  for _ in 0..<(toSize - string.count) {
//    padded = "0" + padded
//  }
//    return padded
//}
//
////L-вектор для реализации R-преобразования
//
//var lVector: [UInt8] = [
//    148, 32, 133, 16, 194, 192, 1,
//    251, 1, 192, 194, 16, 133, 32, 148, 1
//]
//var testVector: [UInt8] = [
//    0x7E, 0x0C, 0x7D, 0xD8, 0xB6, 0xD8, 0x7D, 0xD8,
//    0x77, 0x77, 0x88, 0x6C, 0xD7, 0x6C, 0x88, 0x79
//]
////print(testVector)
//
//// массив для хранения итерационных констант С (32) 16 байт каждая
//var iterC: [[UInt8]] = Array(
//    repeating: Array(repeating: UInt8(0x00), count: 16),
//    count: 32
//)
//
////ФУНКЦИЯ УМНОЖЕНИЕ В ПОЛЕ ГАЛУА
//
//// & - ПОБИТОВОЕ И
//// ^ - ПОБИТОВОЕ ИЛИ XOR
//
//
////NEW FUNCTION FROM WIKI
//func multiplicateGaluaField(from a: UInt8, and b: UInt8) -> UInt8 {
//    var c: UInt8 = 0
//
//    var tempA = a
//    var tempB = b
//
//    repeat {
//        if ( tempB & 1 ) != 0 {
//            c ^= tempA
//        }
//        if (tempA & 0x80) != 0 {
//            tempA = (tempA << 1) ^ 0xC3
//        } else {
//            tempA <<= 1
//        }
//        tempB >>= 1
//    } while (tempA != 0) && (tempB != 0)
//    return c
//}
//
////ПРЕОБРАЗОВАНИЕ R (умножение + сдвиг)
//func getTransformationR(for state: [UInt8]) -> [UInt8] {
//
//    var aZero: UInt8 = 0
//    var intern: [UInt8] = Array(repeating: 0x00, count: 16)
//
//    for i in 0..<16 {
//
//        if i == 15 {
//            intern[0] = state[i]
//        } else {
//            intern[i+1] = state[i] //ДВИГАЕМ БАЙТЫ В СТОРОНУ МЛАДШЕГО РАЗРЯДА
//        }
//
//        aZero ^= multiplicateGaluaField(from: state[i], and: lVector[i])
//
//
//    }
//
//    //ПИШЕМ В ПОСЛЕДНИЙ БАЙТ РЕЗУЛЬТАТ СЛОЖЕНИЯ
//    intern[0] = aZero
////    print(intern)
//    return intern
//}
//
////ПРЕОБРАЗОВАНИЕ L
//func getTransformationL(for inData: [UInt8]) -> [UInt8] {
//    var outData: [UInt8] = Array(repeating: 0x00, count: inData.count)
//    var intern = inData
//    for _ in 0..<15 {
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
//
//// ОБРАТНОЕ ПРЕОБРАЗОВАНИЕ R
//func getReverseR(for state: [UInt8]) -> [UInt8] {
//    var a0: UInt8 = state[15]
//    var intern:  [UInt8] = Array(repeating: 0x00, count: 16)
//    for i in 1..<16 {
//
//        intern[i] = state[i - 1] //двигаем все на старые места
//        a0 ^= multiplicateGaluaField(from: intern[i], and: lVector[i])
//    }
//
//    intern[0] = a0
//    return intern
//}
//func getReverseRR(for state: [UInt8]) -> [UInt8] {
//    var i = 15
//    var aLast: UInt8 = state[0]
//    var intern:  [UInt8] = Array(repeating: 0x00, count: 16)
//    repeat {
//
//        intern[i-1] = state[i]
//        aLast ^= multiplicateGaluaField(from: intern[i-1], and: lVector[i-1])
//        i -= 1
//    } while i != 0
//
//    intern[15] = aLast
//    return intern
//}
//
////ОБРАТНОЕ ПРЕОБРАЗОВАНИЕ L
//func getReverseL(for inData: [UInt8]) -> [UInt8] {
//    var outData:  [UInt8] = Array(repeating: 0x00, count: inData.count)
//    var intern: [UInt8] = []
//    intern = inData
//    for _ in 0..<15 {
//        intern = getReverseRR(for: intern)
//    }
//    outData = intern
//    return outData
//}

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

//print(String(testVector[0], radix: 16))
//print(pad(string:String(testVector[0], radix: 2), toSize: 8))
//print(pad(string:String(lVector[0], radix: 2), toSize: 8))
//
//temp = multiplicateGaluaField(from: 0b01111110, and: 0b10010100)
//convert = String(temp, radix: 2)
//print("\(pad(string: convert, toSize: 8))")
//func getIterativeConstants() -> [[UInt8]]{
//
//    var iterativeNumbers = Array(
//        repeating: Array(repeating: UInt8(0x00), count: 16),
//        count: 32
//    ) //номер итерации от 1 до 32
//
//    print(iterativeNumbers)
//
//    for i in 0..<32 {
//        for j in 0..<16 {
//            iterativeNumbers[i][j] = 0
//        }
//        iterativeNumbers[i][0] = UInt8(i + 1)
//    }
//
//    for i in 0..<32 {
//        iterC[i] = getTransformationL(for: iterativeNumbers[i]) //ДЕЛАЕМ ПРЕОБРАЗОВАНИЕ L для каждого элемента массива
//    }
//
//    print(iterativeNumbers)
//    print(iterC)
//    return iterC
//}
//var iterativeConstants = getIterativeConstants()
//for const in iterativeConstants {
//    print("Const # - \(const)")
//}
//print(testVector)
//var lTransformedVector = getTransformationL(for: testVector)
//print(lTransformedVector)
//var reveersedL = getReverseL(for: lTransformedVector)
//print(reveersedL)

//16 to 10
let h2 = "9"
let d4 = Int(h2, radix: 16)!
print(d4)

//10 to 16
let d3 = 9
let h1 = String(d3, radix: 16)
print(h1)

//16 to 2
let h4 = "e0"
let b4 = String(Int(h4, radix: 16)!, radix: 2)
print(b4) // "1111101011001110"

// 10 to 2
let d1 = 9
let b1 = String(d1, radix: 2)
print(b1) // "10101"

// 2 to 10
let b2 = "00000100"
let d2 = Int(b2, radix: 2)!
print(d2) // 22

//let key = "8899aabbccddeeff0011223344556677fedcba98765432100123456789abcdef"
//var shufledKey = key.shuffled()
//print(shufledKey.count)
//let password = "passworddogcat"
//let data = Data(password.utf8)
//let digest = SHA256.hash(data: data)
//let hash = digest.compactMap { String(format: "%02x", $0)}.joined()
//print(hash)
//print(hash.count)
var openText = "1122334455667700ffeeddccbbaa9988"
var fullKey = "8899aabbccddeeff0011223344556677fedcba98765432100123456789abcdef"
fullKey.shuffled()
print(openText.count)
print(fullKey.count)
