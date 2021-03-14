//
//  ProductListComponent.swift
//  ProductViewer
//
//  Copyright © 2016 Target. All rights reserved.
//

import UIKit
import Tempo

final class ProductListView: UIView {
    // data views
    @IBOutlet weak var aisleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!

    // display views
    @IBOutlet weak var middleLine: SinglePixelLine!
    @IBOutlet weak var shipLabel: UILabel!
    @IBOutlet weak var orLabel: UILabel!
}

extension ProductListView: ReusableNib {
    @nonobjc static let nibName = "ProductListView"
    @nonobjc static let reuseID = "ProductListViewIdentifier"

    @nonobjc func prepareForReuse() {
        aisleLabel.text = nil
        priceLabel.text = nil
        titleLabel.text = nil
        productImage.image = nil
    }
}
