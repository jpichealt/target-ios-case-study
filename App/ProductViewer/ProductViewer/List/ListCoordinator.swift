//
//  ListCoordinator.swift
//  ProductViewer
//
//  Copyright © 2016 Target. All rights reserved.
//

import Foundation
import Tempo
import Alamofire

/*
 Coordinator for the product list
 */
class ListCoordinator: TempoCoordinator {
    
    // MARK: Presenters, view controllers, view state.
    
    var presenters = [TempoPresenterType]() {
        didSet {
            updateUI()
        }
    }

    fileprivate var viewState: ListViewState {
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
    
    lazy var viewController: ListViewController = {
        return ListViewController.viewControllerFor(coordinator: self)
    }()
    
    // MARK: Init
    
    required init() {
        viewState = ListViewState(listItems: [])
        requestDeals()
        registerListeners()
    }

    // MARK: ListCoordinator

    fileprivate func registerListeners() {
        dispatcher.addObserver(ListItemPressed.self) { [weak self] e in
            let detailCoordinator = DetailCoordinator(for: e.product)
            self?.viewController.navigationController?
                .pushViewController(detailCoordinator.viewController, animated: true)
        }

        dispatcher.addObserver(ListPullToRefresh.self) { [weak self] e in
            self?.requestDeals()
        }
    }

    // MARK: API

    fileprivate func requestDeals() {
        API.getProducts() { [weak self] response in
            switch response {
            case .success(let products):
                self?.viewState.listItems = products.map { p in
                    ListItemViewState(product: p)
                }
            case .failure(_):
                let alert = UIAlertController(title: "Error Refreshing Product Data", message: "Request to refresh product data failed.", preferredStyle: .alert)
                alert.addAction( UIAlertAction(title: "OK", style: .cancel, handler: nil) )
                self?.viewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}
