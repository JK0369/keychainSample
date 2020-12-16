//
//  Keychain.swift
//  MyApp
//
//  Created by 김종권 on 2020/12/16.
//

import Foundation
import KeychainAccess
import Domain

public class KeychainService: KeyValueStore {

    public static let shared = KeychainService()
    private init() {}

    let lockCredentials = Keychain()

    public func save(key: String, value: String) {
        do {
            try lockCredentials.set(value, key: key)
        } catch {
            print(error.localizedDescription)
        }
    }

    public func get(key: String) -> String? {
        do {
            guard let key = try lockCredentials.get(key) else {
                return nil
            }
            return key
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    public func delete(key: String) {
        do {
            try lockCredentials.remove(key)
        } catch {
            print(error.localizedDescription)
        }
    }

    public func removeAll() {
        do {
            try lockCredentials.removeAll()
        } catch {
            print(error.localizedDescription)
        }
    }


}
