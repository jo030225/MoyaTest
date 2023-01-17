//
//  NetworkManager.swift
//  HaruEpisode
//
//  Created by 조주혁 on 2023/01/17.
//

import Foundation
import Moya

class NetworkManager<Provider: TargetType> : MoyaProvider<Provider> {
    
    func requestResult<Model: Codable>(target: Provider, model: Model.Type, completion: @escaping(Result<Model, MoyaError>) -> Void) {
        
        self.request(target) { result in
            switch result {
            case .success(let response):
                if (200..<300).contains(response.statusCode) {
                    print("Status Code: \(response.statusCode)")
                    if let decodeData = try? JSONDecoder().decode(model, from: response.data) {
                        completion(.success(decodeData))
                    } else {
                        completion(.failure(.requestMapping("Decoding Error!")))
                    }
                } else {
                    completion(.failure(.statusCode(response)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestNoResult(target: Provider, completion: @escaping(Result<Bool, MoyaError>) -> Void) {
        
        self.request(target) { result in
            switch result {
            case .success(let response):
                if (200..<300).contains(response.statusCode) {
                    completion(.success(true))
                } else {
                    completion(.failure(.statusCode(response)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

