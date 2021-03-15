//
//  DetailEvents.swift
//  ProductViewer
//
//  Created by Joseph J. Piché on 3/13/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Tempo

struct DetailAddToCartPressed: EventType {
    let product: Product
}

struct DetailAddToListPressed: EventType {
    let product: Product
}

struct DetailShareAction: EventType {}
