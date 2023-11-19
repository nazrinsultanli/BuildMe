//
//  ProfilPageViewModel.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 19.11.23.
//

import Foundation

class ProfilPageViewModel{
    var savedEmail = UserDefaults.standard.string(forKey: "savedEmail")
    var userData = UserHelper().fetch()
}
