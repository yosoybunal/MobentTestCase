//
//  ProductItem.swift
//  MobentTestCase
//
//  Created by Berkay Unal on 19.10.2023.
//

import UIKit

public struct Products: Codable {
  public var products: [Product]
}

public struct Product: Codable {
  public var id: String
  public var name: String
  public var price: Int
  public var imageURLString: String
  public var image: UIImage?

  public init(id: String, name: String,
              price: Int, description: String? = nil,
              imageURLString: String) {
    self.id = id
    self.name = name
    self.price = price
    self.imageURLString = imageURLString
    self.image = nil
  }

  enum CodingKeys: String, CodingKey {
    case name, price
    case id = "product_id"
    case imageURLString = "image"
  }
}

