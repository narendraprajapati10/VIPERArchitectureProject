//
//  ListingProtocols.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import UIKit

protocol ListingViewProtocol: AnyObject {
    var presenter: ListingPresenterProtocol? { get set }
    // PRESENTER -> VIEW
    func showUniversities(_ universities: [University])
    
    func showError(_ message: String)
    
    func showLoading()
    
    func hideLoading()
}

protocol ListingPresenterProtocol: AnyObject {
    var view: ListingViewProtocol? { get set }
    var interactor: ListingInteractorInputProtocol? { get set }
    var router: ListingRouterProtocol? { get set }

    func fetchUniversities()
    func showUniversityDetail(forPost university: University)
}

protocol universityListWireFrameProtocol: AnyObject {
    static func createPostListModule() -> UIViewController
    // PRESENTER -> Router
    func presentPostDetailScreen(from view: ListingViewProtocol, forUniversity university: University)
}


protocol ListingInteractorInputProtocol: AnyObject {
    var presenter: ListingInteractorOutputProtocol? { get set }
    var localDataManager: LocalDataManagerProtocol? { get set }
    var remoteDataManager: RemoteDataManagerProtocol? { get set }

    func fetchUniversities()
}

protocol ListingInteractorOutputProtocol: AnyObject {
    func didFetchUniversities(_ universities: [University])
    func didFailToFetchUniversities(_ error: Error)
}

protocol ListingRouterProtocol: AnyObject {
    static func createListingModule() -> UIViewController
    func navigateToDetailScreen(from view: ListingViewProtocol, with university: University)
}

