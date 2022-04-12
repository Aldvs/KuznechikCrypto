//
//  main.swift
//  KuznechikCrypto
//
//  Created by admin on 10.03.2022.
//

import Foundation

let openText = DataManager.shared.openText
let fullKey = DataManager.shared.fullKey

var keyOne: [UInt8] = []
var keyTwo: [UInt8] = []

var arrayOpenText = stringToArray(str: openText)

//ШИФРОТЕКСТ
var block = convertArrayToBytes(convert: arrayOpenText)

let ourStringFirstKeys = getStringPairOfKeys(key: fullKey)

//ПЕРВАЯ ПАРА КЛЮЧЕЙ
let firstPairOfKeys = getFirstPairOfKeys(for: ourStringFirstKeys)

expandKeys(with: firstPairOfKeys[0], and: firstPairOfKeys[1])
var encryptedBlock = kuznechikEncryption(block: block)
print(encryptedBlock)
var decryptedBlock = kuznechikDencryption(block: encryptedBlock)
print(decryptedBlock)




