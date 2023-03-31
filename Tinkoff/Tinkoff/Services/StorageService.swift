//
//  StorageService.swift
//  Tinkoff
//
//  Created by a.akhmadiev on 31.03.2023.
//

import Foundation

protocol StorageServiceProtocol {
    func saveUser(model: RAWUser) throws
    func fetchUser(with name: String) throws -> RAWUser
}

final class StorageService {

}

extension StorageService: StorageServiceProtocol {
    func saveUser(model: RAWUser) throws {
        
    }

    func fetchUser(with name: String) throws -> RAWUser {
        return RAWUser(name: "", balance: 0)
    }
}
