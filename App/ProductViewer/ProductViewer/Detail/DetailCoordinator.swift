//
//  DetailCoordinator.swift
//  ProductViewer
//
//  Created by Joseph J. Piché on 3/13/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Foundation
import Tempo
import Alamofire
import AlamofireImage

class DetailCoordinator: TempoCoordinator {

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

        dispatcher.addObserver(DetailShareAction.self) { [weak self] e in
            guard let self = self else { return }
            let price = self.viewState.product.salePrice ?? self.viewState.product.regularPrice
            let shareText = "\(self.viewState.product.title) is only \(price.displayString) at Target!"
            let productUrl = URL(string: "http://example.com/targetdeals/product/\(self.viewState.product.id)")!

            if let url = self.viewState.product.imageUrl {
                AF.request(url)
                    .responseImage { [weak self] response in
                    switch response.result {
                    case .success(let image):
                        let items: [Any] = [shareText, productUrl, image]
                        self?.shareItems(items)
                    case .failure:
                        let items: [Any] = [shareText, productUrl]
                        self?.shareItems(items)
                    }
                }
            } else {
                let items: [Any] = [shareText, productUrl]
                self.shareItems(items)
            }
        }
    }

    func updateState() {
        updateUI()
    }

    // MARK: - Private helper functions

    private func shareItems(_ items: [Any]) {
        let activity = UIActivityViewController(activityItems: items, applicationActivities: nil)
        viewController.present(activity, animated: true, completion: nil)
    }
}
