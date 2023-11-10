//
//  NetworkModel.swift
//  iTunesSearchAPIRx
//
//  Created by 황인호 on 11/8/23.
//

import Foundation

struct Search: Decodable {
    let resultCount: Int
    let results: [Results]
}

struct Results: Decodable {
    let artworkUrl512: String //앱 아이콘
    let screenshotUrls: [String] // 스크린샷
    let trackName: String // 앱 이름
    let artistName: String // 앱 제작사 이름
    let releaseNotes: String // 업데이트 내용
    let description: String // 앱 설명
    let version: String // 현재 버전
    let averageUserRating: Double // 평점
    let genres: [String] // 장르
}
