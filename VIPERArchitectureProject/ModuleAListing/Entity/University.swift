//
//  University.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import Foundation
import RealmSwift

class University: Object, Codable {
    @objc dynamic var name: String = ""
    @objc dynamic var country: String = ""
    
}
