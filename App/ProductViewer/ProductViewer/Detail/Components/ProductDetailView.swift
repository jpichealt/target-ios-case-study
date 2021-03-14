//
//  ProductDetailView.swift
//  ProductViewer
//
//  Created by Joseph J. Piché on 3/13/21.
//  Copyright © 2021 Target. All rights reserved.
//

import UIKit
import Tempo

final class ProductDetailView: UIView {
    var addToCartCallback: (() -> ())?
    var addToListCallback: (() -> ())?

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var regularPriceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var addToListButton: UIButton!

    @IBAction func addToCartAction(_ sender: UIButton!) {
        addToCartCallback?()
    }

    @IBAction func addToListAction(_ sender: UIButton!) {
        addToListCallback?()
    }
}

extension ProductDetailView: ReusableNib {
    @nonobjc static let nibName = "ProductDetailView"
    @nonobjc static let reuseID = "ProductDetailViewIdentifier"

    @nonobjc func prepareForReuse() {
    }
}
