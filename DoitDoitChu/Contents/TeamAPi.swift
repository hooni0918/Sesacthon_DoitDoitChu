//
//  TeamAPi.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/06.
//

import Foundation

// MARK: - TeamTodoResponse
struct TeamTodoResponse: Decodable {
    let teamInfoList: [TeamInfo]
}

// MARK: - TeamInfo
struct TeamInfo: Decodable {
    let teamId: Int
    let recommendTodo: String
    let characterLevel: Int
    let characterMaxLevel: Int
    let createDate: String
}




struct TeamUser: Decodable {
    var nickname: String
    var checked: Bool
    // other properties according to your actual server response...
}

struct Response: Decodable {
    var recommendTodo: String
    var teamUserDataList: [TeamUser]
    // other properties according to your actual server response...
}
