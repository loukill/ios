//
//  DoctorService.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import Foundation
import Combine

class DoctorService {
    static let shared = DoctorService()
    
    private let baseURL = "http://127.0.0.1:9090"
    
    func getDoctors(completion: @escaping (Result<[Doctor], Error>) -> Void) {
        let urlString = baseURL + "/rdv/Doctors"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }

            do {
                let doctors = try JSONDecoder().decode([Doctor].self, from: data)
                completion(.success(doctors))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
    
   
        // Implement other CRUD operations (create, update, delete) as needed
    
}

