//
//  UserViewProtocol.swift
//  Tinkoff
//
//  Created by Meiers on 31.03.2023.
//

import Foundation

protocol UserViewProtocol: AnyObject {
    var presenter: UserPresenterProtocol? { get set }
    func showAlert(title: String, message: String)
    func showUserData(name: String, balance: Int)
}
