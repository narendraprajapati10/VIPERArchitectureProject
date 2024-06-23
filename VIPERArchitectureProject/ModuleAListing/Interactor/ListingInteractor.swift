//
//  ListingInteractor.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import Foundation

class ListingInteractor: ListingInteractorInputProtocol {
    var presenter: ListingInteractorOutputProtocol?
    var localDataManager: LocalDataManagerProtocol?
    var remoteDataManager: RemoteDataManagerProtocol?

    func fetchUniversities() {
        remoteDataManager?.fetchUniversities(completion: { [weak self] result in
            switch result {
            case .success(let universities):
                // Cache data to local DB
                self?.localDataManager?.saveUniversities(universities)
                self?.presenter?.didFetchUniversities(universities)
            case .failure(let error):
                // Fetch from local DB if API fails
                if let cachedUniversities = self?.localDataManager?.fetchUniversities() {
                    self?.presenter?.didFetchUniversities(cachedUniversities)
                } else {
                    self?.presenter?.didFailToFetchUniversities(error)
                }
            }
        })
    }
}
