//
//  DetailViewController.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import UIKit

class DetailViewController: UIViewController {
    var presenter: DetailPresenterProtocol?
    var university: University?
    @IBOutlet weak var lblUniverSityName:UILabel!
    @IBOutlet weak var lblUniverSityCountry:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Display university details
//        presenter?.refreshListing()
        if let university = university {
            // Display university name and country
            print("Name: \(university.name)"  )
            lblUniverSityName.text = "Name: \(university.name)"
            lblUniverSityCountry.text = "Country: \(university.country)"
        }
    }

    @IBAction func refreshButtonTapped(_ sender: Any) {
        presenter?.refreshListing()
    }
    
    
}

extension DetailViewController: DetailViewProtocol {
    
    func showUniversityDetail(forUniversity university: University) {
        print("Name: \(university.name)")
        lblUniverSityName.text = "Name: \(university.name)"
        lblUniverSityCountry.text = "Country: \(university.country)"
    }
    
}
