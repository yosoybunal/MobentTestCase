//
//  CollectionViewCell.swift
//  MobentTestCase
//
//  Created by Berkay Unal on 19.10.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
//    var product: Product! {
//        didSet {
//            priceText.text = "\(product.price)"
//            nameText.text = product.name
//            imageView.image = UIImage(named: product.imageURLString)
//        }
//    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    
    public func configure(with item: Product) {
        nameText.text = item.name
        priceText.text = "$\(item.price)"

        if let image = item.image {
        imageView.image = image
      }
      else {
        imageView.setImageFrom(item)
      }
    }
}
