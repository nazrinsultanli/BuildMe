//
//  CategoryHelper.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 12.11.23.
//

import Foundation
import RealmSwift

class CategoryHelper: ObservableObject {
    private(set) var localRealm: Realm?
    @Published var categories: [Categories] = []

    var categoryData = [
        Categories(categoryType: .laminate, imageName: "imageLA"),
        Categories(categoryType: .kafel, imageName: "imageKA"),
        Categories(categoryType: .ceramics, imageName: "imageCE"),
        Categories(categoryType: .accesories, imageName: "imageAC"),
        Categories(categoryType: .asmaTavan, imageName: "imageAT")
    ]

    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1, migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                }
            })
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm(configuration: config)
        } catch {
            print("Error opening Realm", error)
        }
    }

    func saveItems() {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    localRealm.add(categoryData)
                    fetch()
                }
            } catch {
                print("Error adding categories to Realm", error)
            }
        }
    }

    func fetch() {
        if let localRealm = localRealm {
            let data = localRealm.objects(Categories.self)
            categories.removeAll()
            categories.append(contentsOf: data)
        }
    }
    func delete() {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    localRealm.deleteAll()
                    print("delete all categories in Realm!")
                }
            } catch {
                print("Error deleting categories in Realm", error)
            }
        }
    }
    init() {
        openRealm()
        saveItems()
        fetch()
    }
}

