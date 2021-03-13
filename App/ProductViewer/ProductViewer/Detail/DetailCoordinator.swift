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
    }

    let dispatcher = Dispatcher()

    lazy var viewController: DetailViewController = {
        return DetailViewController.viewControllerFor(coordinator: self)
    }()

    // MARK: Init

    required init() {
        viewState = DetailViewState(image: nil, price: "", description: "")
        updateState()
        registerListeners()
    }

    // MARK: ListCoordinator

    fileprivate func registerListeners() {
        dispatcher.addObserver(ListItemPressed.self) { [weak self] e in
            let alert = UIAlertController(title: "Item added to cart!", message: "🐶", preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: "OK", style: .cancel, handler: nil) )
            self?.viewController.present(alert, animated: true, completion: nil)
        }
    }

    func updateState() {
    }
}
