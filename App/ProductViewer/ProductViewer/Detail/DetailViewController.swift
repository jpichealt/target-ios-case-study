//
//  DetailViewController.swift
//  ProductViewer
//
//  Created by Joseph J. Piché on 3/13/21.
//  Copyright © 2021 Target. All rights reserved.
//

import UIKit
import Tempo

class DetailViewController: UIViewController {

    class func viewControllerFor(coordinator: TempoCoordinator) -> DetailViewController {
        let viewController = DetailViewController()
        viewController.coordinator = coordinator

        return viewController
    }

    fileprivate var coordinator: TempoCoordinator!

    lazy var detailView: ProductDetailView = {
        let nib = UINib(nibName: ProductDetailView.nibName, bundle: .main)
        guard let view: ProductDetailView = nib.instantiate(withOwner: self, options: nil).first as? ProductDetailView else {
            fatalError("Unable to instantiate ProductDetailView nib")
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var shareButton: UIBarButtonItem = {
        return UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(shareAction)
        )
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addAndPinRootSubview(detailView)
        view.backgroundColor = .targetStarkWhiteColor

        navigationItem.rightBarButtonItems = [
            shareButton
        ]

        let component = ProductDetailComponent(dispatcher: coordinator.dispatcher)

        coordinator.presenters = [
            DetailViewPresenter(component: component, view: detailView)
        ]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // MARK: -

    @objc func shareAction() {
        coordinator.dispatcher.triggerEvent(DetailShareAction())
    }
}
