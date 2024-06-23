//
//  LocalDataManager.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import Foundation
import RealmSwift

class LocalDataManager: LocalDataManagerProtocol {
    let realm = try! Realm()

    func saveUniversities(_ universities: [University]) {
        try! realm.write {
            realm.add(universities)
        }
    }

    func fetchUniversities() -> [University] {
        return Array(realm.objects(University.self))
    }
}

protocol LocalDataManagerProtocol: AnyObject {
    func saveUniversities(_ universities: [University])
    func fetchUniversities() -> [University]
}

