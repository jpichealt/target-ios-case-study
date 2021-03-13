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

}
