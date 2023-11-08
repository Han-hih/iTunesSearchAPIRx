//
//  APIManager.swift
//  iTunesSearchAPIRx
//
//  Created by 황인호 on 11/8/23.
//

import UIKit
import RxSwift
import RxCocoa

private enum APIError: Error {
    case invalidURL
    case unknownResponse
    case statusError
}

class APIManager {
    static func fetchitunesData(term: String) -> Observable<Search> {
        
        return Observable<Search>.create { observer in
            
            guard let url = URL(string: "https://itunes.apple.com/search?term=\(term)&country=kr&media=software") else {
                observer.onError(APIError.invalidURL)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                print("DataTask Succeed")
                if let _ = error {
                    observer.onError(APIError.unknownResponse)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    observer.onError(APIError.statusError)
                    return
                }
                
                if let data = data, let appData = try? JSONDecoder().decode(Search.self, from: data) {
                    observer.onNext(appData)
                }
            }.resume()
            
            return Disposables.create()
        }
    }
}
