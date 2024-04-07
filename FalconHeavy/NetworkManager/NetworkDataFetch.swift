//
//  NetworkDataFetch.swift
//  FalconHeavy
//
//  Created by Alina Sakovskaya on 7.04.24.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchRocket(responce: @escaping (Rocket?, Error?) -> Void) {
        NetworkRequest.shared.requestData() { result in
            switch result {
            case .success(let data):
                do {
                    let rocket = try JSONDecoder().decode(Rocket.self, from: data)
                    responce(rocket, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                responce(nil, error)
            }
        }
    }
}
