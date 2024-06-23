//
//  ListingPresenter.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import Foundation

class ListingPresenter: ListingPresenterProtocol,ListingInteractorOutputProtocol {
    weak var view: ListingViewProtocol?
    var interactor: ListingInteractorInputProtocol?
    var router: ListingRouterProtocol?

    func fetchUniversities() {
        view?.showLoading()
        interactor?.fetchUniversities()
    }

    func didFetchUniversities(_ universities: [University]) {
        view?.hideLoading()
        view?.showUniversities(universities)
    }

    func didFailToFetchUniversities(_ error: Error) {
        view?.showError(error.localizedDescription)
    }
    
    func showUniversityDetail(forPost university: University) {
        router?.navigateToDetailScreen(from: view!, with: university)//navigateToDetailScreen(from: view!, forUniversity: university)
    }
}



