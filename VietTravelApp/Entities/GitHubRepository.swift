//
//  GitHubRepository.swift
//  VietTravelApp
//
//  Created by Cát Bình Lê on 06/06/2021.
//

import Foundation

struct GitHubRepository: Decodable {
    let id: Int
    let fullName: String
    let description: String
    let stargazersCount: Int
    let url: URL

    private enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case description
        case stargazersCount = "stargazers_count"
        case url = "html_url"
    }

}

struct SearchRepositoriesResponse: Decodable {
    let items: [GitHubRepository]
}
