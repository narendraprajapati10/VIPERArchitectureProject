//
//  DetailRouter.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import UIKit

class DetailRouter: DetailRouterProtocol {

    class func createDetailModule(with university: University) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController")
        if let view = viewController as? DetailViewController {
            let presenter: DetailPresenterProtocol = DetailPresenter()
            let interactor: DetailInteractorInputProtocol = DetailInteractor()
            let router: DetailRouterProtocol = DetailRouter()

            view.presenter = presenter
            view.university = university
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func dismissDetailView(from view: DetailViewProtocol) {
        if let viewController = view as? UIViewController {
            viewController.dismiss(animated: true) {
                // Notify listing screen to refresh
                NotificationCenter.default.post(name: Notification.Name("RefreshListing"), object: nil)
            }
        }
    }
}

