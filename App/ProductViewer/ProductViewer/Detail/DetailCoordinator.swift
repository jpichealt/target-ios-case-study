//
//  DetailCoordinator.swift
//  ProductViewer
//
//  Created by Joseph J. Piché on 3/13/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Foundation
import Tempo

class DetailCoordinator: TempoCoordinator {

    let product: Product

    // MARK: Presenters, view controllers, view state.

    var presenters = [TempoPresenterType]() {
        didSet {
            updateUI()
        }
    }

    fileprivate var viewState: DetailViewState {
        didSet {
            updateUI()
        }
    }

    fileprivate func updateUI() {
        for presenter in presenters {
            presenter.present(viewState)
        }

        viewController.title = viewState.product.title
    }

    let dispatcher = Dispatcher()

    lazy var viewController: DetailViewController = {
        return DetailViewController.viewControllerFor(coordinator: self)
    }()

    // MARK: Init

    required init(for product: Product) {
        self.product = product

        viewState = DetailViewState(product: product)
        updateState()
        registerListeners()
    }

    // MARK: ListCoordinator

    fileprivate func registerListeners() {
        dispatcher.addObserver(DetailAddToCartPressed.self) { [weak self] e in
            let alert = UIAlertController(
                title: "Added to Cart!",
                message: "Added \(e.product.title) to your cart.",
                preferredStyle: .alert
            )

            alert.addAction( UIAlertAction(title: "OK", style: .cancel, handler: nil) )
            self?.viewController.present(alert, animated: true, completion: nil)
        }

        dispatcher.addObserver(DetailAddToListPressed.self) { [weak self] e in
            let alert = UIAlertController(
                title: "Added to List!",
                message: "Added \(e.product.title) to your list.",
                preferredStyle: .alert
            )

            alert.addAction( UIAlertAction(title: "OK", style: .cancel, handler: nil) )
            self?.viewController.present(alert, animated: true, completion: nil)
        }
    }

    func updateState() {
        updateUI()
    }
}
