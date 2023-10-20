//
//  ProductDetail.swift
//  MobentTestCase
//
//  Created by Berkay Unal on 20.10.2023.
//

import UIKit

public struct ProductDetailModal: Codable {
  public var id: String
  public var name: String
  public var price: Int
  public var description: String?
  public var imageURLString: String
  public var image: UIImage?

  public init(id: String, name: String,
              price: Int, description: String? = nil,
              imageURLString: String) {
    self.id = id
    self.name = name
    self.price = price
    self.description = description
    self.imageURLString = imageURLString
    self.image = nil
  }

  enum CodingKeys: String, CodingKey {
    case name, price, description
    case id = "product_id"
    case imageURLString = "image"
  }
}
