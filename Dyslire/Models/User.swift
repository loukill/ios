//
//  User.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import Foundation
import SwiftUI
import CoreData


struct User: Decodable ,Encodable{
    let userId: String // Adjust the data types based on your actual server response
    let name: String
    let lastName: String
    let role: String
    let numTel: Int
    
    // Add other properties as needed

    // Define CodingKeys if the JSON keys don't match the property names
    enum CodingKeys: String, CodingKey {
        case userId = "_id"
   
        case role = "role"
        case numTel = "numTel"
     
        case name = "name"
        case lastName = "lastName"
        // Add other keys as needed
    }
}

