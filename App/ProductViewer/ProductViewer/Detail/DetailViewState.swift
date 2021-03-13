//
//  DetailViewState.swift
//  ProductViewer
//
//  Created by Joseph J. Piché on 3/13/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Tempo

/// Detail View State
struct DetailViewState: TempoViewState {
    let image: UIImage?
    let price: String
    let description: String
}
