//
//  DetailPresenter.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?

    func refreshListing() {
        router?.dismissDetailView(from: view!)
    }
}
