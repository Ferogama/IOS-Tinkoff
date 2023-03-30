//
//  UserView.swift
//  Tinkoff
//
//  Created by Meiers on 30.03.2023.
//

import Foundation

protocol UserView: class {
    func showError()
    func showUser(name: String, balance: Double)
}
