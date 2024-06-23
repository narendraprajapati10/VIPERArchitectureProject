//
//  DetailProtocols.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }
    var university: University? { get set }
    
    // PRESENTER -> VIEW
    func showUniversityDetail(forUniversity university: University)

}

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var router: DetailRouterProtocol? { get set }

    func refreshListing()
}

protocol DetailInteractorInputProtocol: AnyObject {
    var presenter: DetailInteractorOutputProtocol? { get set }
}

protocol DetailInteractorOutputProtocol: AnyObject {
    
}

protocol DetailRouterProtocol: AnyObject {
    static func createDetailModule(with university: University) -> UIViewController
    func dismissDetailView(from view: DetailViewProtocol)
}

