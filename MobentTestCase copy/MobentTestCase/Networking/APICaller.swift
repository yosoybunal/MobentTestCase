//
//  APICaller.swift
//  MobentTestCase
//
//  Created by Berkay Unal on 20.10.2023.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}


public class APICaller {

    static func getProducts(completion: @escaping (Products) -> Void) {

        let urlString = "https://s3-eu-west-1.amazonaws.com/developer-application-test/cart/list"

        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            do{
                let fetchData = try JSONDecoder().decode(Products.self, from: data!)
                completion(fetchData)
            }
            catch {
                print("parsing error")
            }
        } .resume()
    }
    
    static func getProductDetails(id: String, completion: @escaping (ProductDetailModal) -> Void) {
        
            let urlString = "https://s3-eu-west-1.amazonaws.com/developer-application-test/cart/"+"\(id)"+"/detail"

            guard let url = URL(string: urlString) else {
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                do{
                    let fetchProductDetail = try JSONDecoder().decode(ProductDetailModal.self, from: data!)
                    completion(fetchProductDetail)
                }
                catch {
                    print("parsing error")
                }
            }.resume()
    }
}
