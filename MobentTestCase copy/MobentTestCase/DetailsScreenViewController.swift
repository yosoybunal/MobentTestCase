//
//  DetailsScreenViewController.swift
//  MobentTestCase
//
//  Created by Berkay Unal on 20.10.2023.
//

import UIKit

class DetailsScreenViewController: UIViewController {
    
    var product: Product?
    var productDetail: ProductDetailModal? {
        didSet {
          DispatchQueue.main.async {
              self.view.reloadInputViews()
          }
        }
      }

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescp: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            APICaller.getProductDetails(product: self.product!) { result in
                self.productDetail = result
            }
        }
        self.configure(with: product!)
    }
    
    func configure(with item: Product) {
        self.productName.text = item.name
        self.productPrice.text = "$\(item.price)"
        self.productDescp.text = "TEST"

        if let image = item.image {
            self.productImage.image = image
      }
      else {
          self.productImage.setImageFrom(item)
      }
    }
}
