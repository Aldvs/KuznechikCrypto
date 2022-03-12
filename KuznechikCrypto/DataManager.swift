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
    let iterativeConstants = [
        1:"6ea276726c487ab85d27bd10dd849401",
        2:"dc87ece4d890f4b3ba4eb92079cbeb02",
        3:"b2259a96b4d88e0be7690430a44f7f03",
        4:"7bcd1b0b73e32ba5b79cb140f2551504",
        5:"156f6d791fab511deabb0c502fd18105",
        6:"a74af7efab73df160dd208608b9efe06",
        7:"c9e8819dc73ba5ae50f5b570561a6a07",
        8:"f6593616e6055689adfba18027aa2a08",
        9:"fb9840648a4d2c31f0dc1c90fa2ebe09",
        10:"2adedaf23e95a23a17b518a05e61c10a",
        11:"447cac8052ddd8824a92a5b083e5550b",
        12:"8d942d1d95e67d2c1a6710c0d5ff3f0c",
        13:"",
        14:"",
        15:"",
        16:"",
        17:"",
        18:"",
        19:"",
        20:"",
        21:"",
        22:"",
        23:"",
        24:"",
        25:"",
        26:"",
        27:"",
        28:"",
        29:"",
        30:"",
        31:"",
        32:""
    ]
    
    private init() {}
    
}

