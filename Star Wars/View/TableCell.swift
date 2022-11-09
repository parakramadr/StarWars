//
//  TableCell.swift
//  Swift-TableView-Example
//
//  Created by Bilal ARSLAN on 11/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView{
  func imageFrom(url:URL){
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url){
        if let image = UIImage(data:data){
          DispatchQueue.main.async{
            self?.image = image
          }
        }
      }
    }
  }
}
class TableCell: UITableViewCell {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var climate: UILabel!
    @IBOutlet private var thumbnailImageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        climate.text = nil
        thumbnailImageView.image = nil
    }

    // MARK: Cell Configuration

    func configurateTheCell(_ details: PlanetResult) {
        nameLabel.text = details.name
        climate.text = "Climate: " + details.climate
        thumbnailImageView.imageFrom(url: URL(string:"https://picsum.photos/200/300")!)
    }

}
