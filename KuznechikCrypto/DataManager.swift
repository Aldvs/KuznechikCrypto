//
//  File.swift
//  KuznechikCrypto
//
//  Created by admin on 12.03.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    //Общий ключ длинной 256 бит
    
    var fullKey = "8899aabbccddeeff0011223344556677fedcba98765432100123456789abcdef"
    
    let firstKey = "8899aabbccddeeff0011223344556677"
    let secondKey = "fedcba98765432100123456789abcdef"
    
    var iterativeKeys = [
        1:"",
        2:"",
        3:"",
        4:"",
        5:"",
        6:"",
        7:"",
        8:"",
        9:"",
        10:""
    ]
    
    //Итерационные константы С (128 бит)
    
    let iterativeOne = "6ea276726c487ab85d27bd10dd849401"
    let iterativeTwo = "dc87ece4d890f4b3ba4eb92079cbeb02"
    let iterativeThree = "b2259a96b4d88e0be7690430a44f7f03"
    let iterativeFour = "7bcd1b0b73e32ba5b79cb140f2551504"
    let iterativeFive = "156f6d791fab511deabb0c502fd18105"
    let iterativeSix = "a74af7efab73df160dd208608b9efe06"
    let iterativeSeven = "c9e8819dc73ba5ae50f5b570561a6a07"
    let iterativeEight = "f6593616e6055689adfba18027aa2a08"
    
    private init() {}
    
    
    func getPartOfFullKey(key fullKey: String) -> [String] {
        
        var pairOfKyes = [String]()
        
        let halfKey: Int = fullKey.count / 2
        let firstKey = fullKey[fullKey.startIndex..<fullKey.index(fullKey.startIndex, offsetBy: halfKey)]
        let secondKey = fullKey[fullKey.index(fullKey.startIndex, offsetBy: halfKey)..<fullKey.endIndex]
        
        pairOfKyes.append(String(firstKey))
        pairOfKyes.append(String(secondKey))
        
        return pairOfKyes
    }
    
}

