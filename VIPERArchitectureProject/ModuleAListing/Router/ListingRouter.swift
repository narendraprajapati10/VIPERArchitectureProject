//
//  ListingRouter.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import UIKit


class ListingRouter: ListingRouterProtocol {
    static func createListingModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "PostNavigationController")
        if let view = navController.children.first as? ListingViewController {
            let presenter: ListingPresenterProtocol & ListingInteractorOutputProtocol = ListingPresenter()
            let interactor: ListingInteractorInputProtocol = ListingInteractor()
            let router: ListingRouterProtocol = ListingRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            interactor.presenter = presenter
            
            // Setup local and remote data managers
            let localDataManager = LocalDataManager()
            let remoteDataManager = RemoteDataManager()
            interactor.localDataManager = localDataManager
            interactor.remoteDataManager = remoteDataManager
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    func navigateToDetailScreen(from view: ListingViewProtocol, with university: University) {
        let detailViewController = DetailRouter.createDetailModule(with: university)
        if let viewController = view as? UIViewController {
            viewController.present(detailViewController, animated: true, completion: nil)
        }
    }
}

