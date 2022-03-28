import Cocoa

//var fullKey = "8899aabbccddeeff0011223344556677fedcba98765432100123456789abcdef"
//
////func getPartOfFullKey(key fullKey: String) -> [String] {
////
//var pairOfKyes = [String]()
//
//let halfKey: Int = fullKey.count / 2
//let firstKey = fullKey[fullKey.startIndex..<fullKey.index(fullKey.startIndex, offsetBy: halfKey)]
//let secondKey = fullKey[fullKey.index(fullKey.startIndex, offsetBy: halfKey)..<fullKey.endIndex]
//
//print(firstKey)
//print(type(of: firstKey))
//print(secondKey)
//print(type(of: secondKey))
//
////pairOfKyes.append(firstKey)
////pairOfKyes.append(secondKey)
//
////    return pairOfKyes
////}
///
let aTestVect: [UInt8] = [0x11,0x22,0x33,0x44,0x55,0x66,0x77,0x00,0xFF,0xEE,0xDD,0xCC,0xBB,0xAA,0x99,0x88]
let kTestVect: [UInt8] = [0x66,0x77,0x88,0x99,0xAA,0xBB,0xCC,0xDD,0xEE,0xFF,0x11,0x22,0x33,0x44,0x55,0x01]

var result: [UInt8] = []

for i in 0..<16 {
    result.append(aTestVect[i] ^ kTestVect[i])
}
print(result)

let h2 = result[15]
let d4 = String(h2, radix: 16)
print(d4)

//func getXOR(from firstVect: [UInt8], and secondVect: [UInt8]) -> [UInt8] {
//    var result: [UInt8] = []
//    for i in 0..<16 {
//        result[i] = firstVect[i] ^ secondVect[i]
//    }
//    return result
//}
//
//getXOR(from: aTestVect, and: kTestVect)



