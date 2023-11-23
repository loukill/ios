//
//  Doctor.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import Foundation

struct DiplomaVerification: Codable {
    let isVerified: Bool
}

struct Doctor: Codable, Identifiable {
    let id: String
    let name: String
    let lastName: String
    let password: String?
    let numTel: Int?
    let location: String?
    let role: String?
    let diplomaVerification: DiplomaVerification?
    let ratings: [Double]?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, lastName, password, numTel, location, role, diplomaVerification, ratings
 
    }
}

