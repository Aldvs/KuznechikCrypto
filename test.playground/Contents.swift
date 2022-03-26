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
func getXOR(from firstVect: UInt8, and secondVect: UInt8) -> UInt8 {
    firstVect ^ secondVect
}
getXOR(from: 0b00001100, and: 0b11111111)



