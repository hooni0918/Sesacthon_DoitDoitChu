//
//  TeamAPi.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/06.
//

import Foundation

// MARK: - TeamTodoLabel
struct TeamTodoLabel: Decodable {
    let teamID: Int?
    let recommendTodo: String?
    let characterLevel, characterMaxLevel: Int?
    let createDate: String?
}


struct User: Decodable {
    let userId: Int
    let nickname: String
    let token: String
    let checked: Bool
}

struct Response: Decodable {
    let teamUserDataList: [User]
    let recommendTodo: String
}
