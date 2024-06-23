//
//  RemoteDataManager.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import Foundation
import Alamofire

class RemoteDataManager: RemoteDataManagerProtocol {
    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void) {
        let url = Constants.API
        AF.request(url).responseDecodable(of: [University].self) { response in
            switch response.result {
            case .success(let universities):
                completion(.success(universities))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

protocol RemoteDataManagerProtocol: AnyObject {
    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void)
}

