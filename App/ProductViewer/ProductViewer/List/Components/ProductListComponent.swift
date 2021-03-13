//
//  ProductListComponent.swift
//  ProductViewer
//
//  Copyright © 2016 Target. All rights reserved.
//

import Tempo

struct ProductListComponent: Component {
    var dispatcher: Dispatcher?

    func prepareView(_ view: ProductListView, item: ListItemViewState) {
        view.backgroundColor = .targetStarkWhiteColor
        view.layer.borderColor = HarmonyColor.targetStrokeGrayColor.cgColor
        view.layer.borderWidth = HarmonyScreen.onePixel
        view.layer.cornerRadius = 5

        view.middleLine.color = .targetStrokeGrayColor

        view.aisleLabel.layer.borderColor = HarmonyColor.targetStrokeGrayColor.cgColor
        view.aisleLabel.layer.borderWidth = 1
        view.aisleLabel.layer.cornerRadius = view.aisleLabel.frame.height / 2
    }

    func configureView(_ view: ProductListView, item: ListItemViewState) {
        view.titleLabel.text = item.title
        view.priceLabel.text = item.price
        view.productImage.image = item.image
        view.aisleLabel.text = item.aisle
    }
    
    func selectView(_ view: ProductListView, item: ListItemViewState) {
        dispatcher?.triggerEvent(ListItemPressed())
    }
}

extension ProductListComponent: HarmonyLayoutComponent {
    func heightForLayout(_ layout: HarmonyLayout, item: TempoViewStateItem, width: CGFloat) -> CGFloat {
        return 100.0
    }
}
