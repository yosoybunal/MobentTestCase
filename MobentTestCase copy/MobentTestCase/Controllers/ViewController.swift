//
//  ViewController.swift
//  MobentTestCase
//
//  Created by Berkay Unal on 19.10.2023.
//

import UIKit

class ViewController: UIViewController{
        
    private var products: [Product]? {
        didSet {
          DispatchQueue.main.async {
              self.collectionView.reloadData()
          }
        }
      }
    
    var productDetail: ProductDetailModal? 

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        title = "Products"
        
        APICaller.getProducts { result in
            self.products = result.products
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! DetailsScreenViewController
        destVC.product = sender as? Product
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell

      if let item = products?[indexPath.row] {
        cell.configure(with: item)
      }
        cell.contentView.addBorder(color: .systemTeal, width: 1)
        cell.contentView.round(20)
      return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products?[indexPath.row]
        performSegue(withIdentifier: "ToDetailsScreenVC", sender: product)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 150
        let height = 220
        return CGSize(width: width, height: height)
    }
}
