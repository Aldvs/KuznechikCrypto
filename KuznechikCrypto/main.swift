//
//  main.swift
//  KuznechikCrypto
//
//  Created by admin on 10.03.2022.
//

import Foundation

let openText = DataManager.shared.openText
let fullKey = DataManager.shared.fullKey

func encryptionFunc(block openText: String, master key: String) -> String {
    
    let block = stringToBytes(for: openText)
    prepareKeys(master: key)
    let encryptedBlock = kuznechikEncryption(block: block)
    let resultString = getString(for: encryptedBlock)
    
    return resultString
}

func decryptionFunc(entireText openText: String) -> String {
    let tempBlock = stringToBytes(for: openText)
    let decryptedBlock = kuznechikDencryption(block: tempBlock)
    let resultString = getString(for: decryptedBlock)
    
    return resultString
}

func prepareKeys(master key: String) {
    let ourStringFirstKeys = getStringPairOfKeys(key: key)
    let firstPairOfKeys = getFirstPairOfKeys(for: ourStringFirstKeys)
    expandKeys(with: firstPairOfKeys[0], and: firstPairOfKeys[1])

}

////ШИФРОТЕКСТ
//print(openText)
//var block = stringToBytes(for: openText)
//
//let ourStringFirstKeys = getStringPairOfKeys(key: fullKey)

//ПЕРВАЯ ПАРА КЛЮЧЕЙ
//let firstPairOfKeys = getFirstPairOfKeys(for: ourStringFirstKeys)
//print(firstPairOfKeys[0])
//print(firstPairOfKeys[1])

//expandKeys(with: firstPairOfKeys[0], and: firstPairOfKeys[1])

var encryptedBlock = encryptionFunc(block: openText, master: fullKey)
print("ENCRYPTED BLOCK ____________________________")
print(encryptedBlock)

var decryptedBlock = decryptionFunc(entireText: encryptedBlock)
print("DECRYPTED BLOCK ____________________________")
print(decryptedBlock)





