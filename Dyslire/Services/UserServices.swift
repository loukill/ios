//
//  UserServices.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import Foundation
import Combine
enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingError
}
struct UserServices {
    static let shared = UserServices()

       private let baseURL = "http://127.0.0.1:9090"

       func PatientSignUp(name: String, lastName: String, password: String, numTel: String, dateNaiss: String, otp: String, completion: @escaping (Result<String, Error>) -> Void) {
           let urlString = baseURL + "/users/UtilisateurSignUp"
           guard let url = URL(string: "\(baseURL)/users/UtilisateurSignUp") else {
               completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
               return
           }

           let parameters: [String: Any] = [
               "name": name,
               "lastName": lastName,
               "password": password,
               "numTel": numTel,
               "dateNaiss": dateNaiss,
               "otp": otp
           ]

           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")

           do {
               request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
           } catch {
               completion(.failure(error))
               return
           }

           let task = URLSession.shared.dataTask(with: request) { data, response, error in
               if let error = error {
                   completion(.failure(error))
                   return
               }

               guard let data = data else {
                   completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                   return
               }

               do {
                   let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

                   if let message = json?["message"] as? String {
                       completion(.success(message))
                   } else if let errorMessage = json?["error"] as? String {
                       completion(.failure(NSError(domain: errorMessage, code: 0, userInfo: nil)))
                   } else {
                       completion(.failure(NSError(domain: "Unexpected response", code: 0, userInfo: nil)))
                   }
               } catch {
                   completion(.failure(error))
               }
           }

           task.resume()
       }
    func sendOtp(numTel: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/users/sendOTP") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = ["numTel": numTel]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            completion(.failure(NetworkError.invalidResponse))
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([String: String].self, from: data)
                if let otp = result["otp"] {
                    completion(.success(otp))
                } else {
                    completion(.failure(NetworkError.decodingError))
                }
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }.resume()
    }

    func login(numTel: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        let urlString = baseURL + "/users/login"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "numTel": numTel,
            "password": password
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }

            if (200..<300).contains(httpResponse.statusCode) {
                if let cookies = httpResponse.allHeaderFields["Set-Cookie"] as? String {
                    let components = cookies.components(separatedBy: ";")
                    var jwtToken: String?
                    for cookie in components {
                        if cookie.contains("jwt=") {
                            jwtToken = cookie.replacingOccurrences(of: "jwt=", with: "").trimmingCharacters(in: .whitespaces)
                        }
                    }

                    guard let token = jwtToken else {
                        completion(.failure(NetworkError.invalidResponse))
                        return
                    }

                    do {
                        let user = try JSONDecoder().decode(User.self, from: data)
                        // Store the received JWT token in the session manager
                        SessionManager.shared.authToken = token
                        completion(.success(user))
                    } catch {
                        completion(.failure(NetworkError.decodingError))
                    }
                } else {
                    completion(.failure(NetworkError.invalidResponse))
                }
            } else {
                completion(.failure(NetworkError.requestFailed))
            }
        }

        task.resume()
    }



}
