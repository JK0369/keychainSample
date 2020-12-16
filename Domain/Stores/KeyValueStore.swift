//
//  KeyValueStore.swift
//  Domain
//
//  Created by 김종권 on 2020/12/16.
//

import Foundation

import Foundation

public protocol KeyValueStore {
    func save(key: String, value: String)
    func get(key: String) -> String?
    func delete(key: String)
    func removeAll()
}

public extension KeyValueStore {

    func getName() -> String {
        return get(key: Constants.KeyChainKey.name) ?? ""
    }

    func getEmail() -> String {
        return get(key: Constants.KeyChainKey.email) ?? ""
    }

    func saveName(_ name: String) {
        return save(key: Constants.KeyChainKey.name, value: name)
    }

    func saveEmail(_ email: String) {
        return save(key: Constants.KeyChainKey.email, value: email)
    }

    func deleteUserInfo() {
        delete(key: Constants.KeyChainKey.name)
        delete(key: Constants.KeyChainKey.email)
    }
}
