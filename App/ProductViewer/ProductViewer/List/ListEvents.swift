//
//  ListEvents.swift
//  ProductViewer
//
//  Copyright © 2016 Target. All rights reserved.
//

import Tempo

struct ListItemPressed: EventType {
    let product: Product
}

struct ListPullToRefresh: EventType {}
