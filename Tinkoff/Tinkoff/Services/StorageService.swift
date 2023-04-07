

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
