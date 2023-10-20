//
//  UIImageView-Extension.swift
//  MobentTestCase
//
//  Created by Berkay Unal on 19.10.2023.
//

import UIKit

public extension UIImageView {

  func setImageFrom(_ item: Product, placeHolder: UIImage? = UIImage(named: "Marketplace")) {
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    addSubview(activityIndicator)

    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

      let imageURLString = item.imageURLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

    if let url = URL(string: imageURLString) {

      activityIndicator.startAnimating()
      URLSession.shared.dataTask(with: url) { data, response, error in

        if let _ = error {
          DispatchQueue.main.async {
            self.image = placeHolder
            activityIndicator.stopAnimating()
          }
        }
        else {
          DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            if let data = data, let image = UIImage(data: data) {
              self.image = image
            }
          }
        }
      }.resume()
    }
  }
}

