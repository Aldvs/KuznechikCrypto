//
//  main.swift
//  KuznechikCrypto
//
//  Created by admin on 10.03.2022.
//

import Foundation

//MARK: - РАЗВЕРТКА КЛЮЧЕЙ ФУНКЦИИ

//ФУНКЦИЯ РАЗБИЕНИЯ ОСВНОВНОГО КЛЮЧА К ДЛИНОЙ 256 бит на ДВА КЛЮЧА К1, К2 ДЛИНОЙ 128 БИТ

func getPartOfFullKey(key fullKey: String) -> [String] {
    
    var pairOfKyes = [String]()
    
    let halfKey: Int = fullKey.count / 2
    let firstKey = fullKey[fullKey.startIndex..<fullKey.index(fullKey.startIndex, offsetBy: halfKey)]
    let secondKey = fullKey[fullKey.index(fullKey.startIndex, offsetBy: halfKey)..<fullKey.endIndex]
    
    pairOfKyes.append(String(firstKey))
    pairOfKyes.append(String(secondKey))
    
    return pairOfKyes
}

let ourFirstKeys = getPartOfFullKey(key: DataManager.shared.fullKey)

print(ourFirstKeys)

var i = 1
repeat {
    for elem in ourFirstKeys {
        print(i)
        print(elem)
        DataManager.shared.iterativeKeys.updateValue(elem, forKey: i)
        i += 1
    }
} while i < 3

print(DataManager.shared.iterativeKeys)

//MARK: - АЛГОРИТМ ШИФРОВАНИЯ
let openText = "1122334455667700ffeeddccbbaa9988"



