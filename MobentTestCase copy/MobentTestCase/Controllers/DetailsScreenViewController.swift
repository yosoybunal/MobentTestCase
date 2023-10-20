//
//  DetailsScreenViewController.swift
//  MobentTestCase
//
//  Created by Berkay Unal on 20.10.2023.
//

import UIKit

class DetailsScreenViewController: UIViewController {
    
    var product: Product?
    var productDetail: ProductDetailModal?

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescp: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            APICaller.getProductDetails(id: self.product!.id) { result in
                   self.productDetail = result
                }
            }
        }
    
    override func viewDidAppear(_ animated: Bool) {
        self.configure(with: productDetail!)
    }
    
    func configure(with item: ProductDetailModal) {
        self.productName.text = item.name
        self.productPrice.text = "$\(item.price)"
        self.productDescp.text = item.description ?? "UNKNOWN DESCP"

        if let image = item.image {
            self.productImage.image = image
      }
      else {
          self.productImage.setImageFrom(product!)
      }
    }
}
