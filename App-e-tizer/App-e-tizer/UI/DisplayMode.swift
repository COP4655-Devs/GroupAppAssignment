//
//  DisplayMode.swift
//  App-e-tizer
//
//  Created by Daniel Condly on 11/21/22.
//

import Foundation

enum DisplayMode: Hashable {
    case list
    case map

    var isMap: Bool {
        get {
            switch self {
            case .map: return true
            default: return false
            }
        }
        set {
            self = .map
        }

    }

    var isList: Bool {
        get {
            switch self {
            case .list: return true
            default: return false
            }
        }
        set {
            self = .list
        }
    }
}
