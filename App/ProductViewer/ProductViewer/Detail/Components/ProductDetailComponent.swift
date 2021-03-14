//
//  ProductDetailComponent.swift
//  ProductViewer
//
//  Created by Joseph J. Piché on 3/13/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Tempo
import Alamofire
import AlamofireImage

struct ProductDetailComponent {
    var dispatcher: Dispatcher?

    func prepareView(_ view: ProductDetailView, viewState: DetailViewState) {
        view.backgroundColor = .targetStarkWhiteColor

        view.priceLabel.textColor = .targetJetBlackColor

        view.addToCartButton.layer.cornerRadius = 4
        view.addToCartButton.backgroundColor = .targetBullseyeRedColor
        view.addToCartButton.setTitleColor(.targetStarkWhiteColor, for: .normal)

        view.addToListButton.layer.cornerRadius = 4
        view.addToListButton.backgroundColor = .targetStrokeGrayColor
        view.addToListButton.setTitleColor(.targetJetBlackColor, for: .normal)

        view.addToCartCallback = {
            dispatcher?.triggerEvent(
                DetailAddToCartPressed(product: viewState.product)
            )
        }

        view.addToListCallback = {
            dispatcher?.triggerEvent(
                DetailAddToListPressed(product: viewState.product)
            )
        }
    }

    func configureView(_ view: ProductDetailView, viewState: DetailViewState) {
        if let salePrice = viewState.product.salePrice {
            view.priceLabel.textColor = .targetBullseyeRedColor
            view.priceLabel.text = salePrice.displayString

            view.regularPriceLabel.text = "reg \(viewState.product.regularPrice.displayString)"

        } else {
            view.priceLabel.textColor = .targetJetBlackColor
            view.priceLabel.text = viewState.product.regularPrice.displayString

            view.regularPriceLabel.text = nil
        }

        view.descriptionLabel.text = viewState.product.description

        viewState.product.imageUrl.flatMap {
            view.productImage.af.setImage(withURL: $0)
        }
    }
}
