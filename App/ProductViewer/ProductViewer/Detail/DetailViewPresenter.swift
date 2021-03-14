//
//  DetailViewPresenter.swift
//  ProductViewer
//
//  Created by Joseph J. Piché on 3/13/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Foundation
import Tempo

class DetailViewPresenter: TempoPresenter {

    fileprivate let component: ProductDetailComponent
    fileprivate let view: ProductDetailView

    init(component: ProductDetailComponent, view: ProductDetailView) {
        self.component = component
        self.view = view
    }

    func present(_ viewState: DetailViewState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            // I will call out here that in rolling my own Presenter instead of
            // using the built-in one for CollectionViews that there are peices
            // I seem to be missing, including calling `prepareView` once early
            // on and only calling `configureView` when data is updated.
            //
            // This doesn't currently cause any issues with the end result
            // though, so I am okay with leaving it for this exercise.
            self.component.prepareView(self.view, viewState: viewState)
            self.component.configureView(self.view, viewState: viewState)
        }
    }
}
