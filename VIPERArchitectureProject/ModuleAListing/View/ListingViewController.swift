//
//  ListingViewController.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import UIKit
import PKHUD
class ListingViewController: UIViewController {
    var presenter: ListingPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    var arrUniversityList: [University] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup UI and call presenter to fetch data
        
        presenter?.fetchUniversities()
        tableView.tableFooterView = UIView()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshListing), name: Notification.Name("RefreshListing"), object: nil)
    }
    
    @objc func refreshListing() {
        presenter?.fetchUniversities()
    }

}

extension ListingViewController :ListingViewProtocol {
   
    func showUniversities(_ universities: [University]) {
        // Display universities in a table view
        arrUniversityList = universities
        tableView.reloadData()

    }

    func showError(_ message: String) {
        Global.showAlert(title: "Title", message: message)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
}

extension ListingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityTableViewCell", for: indexPath) as! UniversityTableViewCell
        
        let university = arrUniversityList[indexPath.row]
        cell.set(forList: university)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUniversityList.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showUniversityDetail(forPost: arrUniversityList[indexPath.row])
    }
    
}
