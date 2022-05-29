//
//  main.swift
//  KuznechikCrypto
//
//  Created by admin on 10.03.2022.
//

import Foundation

let openText = "1122334455667700ffeeddccbbaa9988"
let fullKey = "8899aabbccddeeff0011223344556677fedcba98765432100123456789abcdef"

print("--------------------------------------------------------------")
print("ИСХОДНЫЙ БЛОК: \(openText) \n")
print("МАСТЕР КЛЮЧ: \(fullKey)")
print("--------------------------------------------------------------")

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

var encryptedBlock = encryptionFunc(block: openText, master: fullKey)

print("--------------------------------------------------------------")
print("ШИФРОТЕКСТ: \(encryptedBlock) \n")
var decryptedBlock = decryptionFunc(entireText: encryptedBlock)
print("РАСШИФРОВАННЫЙ ТЕКСТ: \(decryptedBlock)")
print("--------------------------------------------------------------")





