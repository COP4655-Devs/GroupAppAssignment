//
//  PointOfInterest.swift
//  App-e-tizer
//
//  Created by Daniel Condly on 11/21/22.
//

import Foundation
import MapKit

struct PointOfInterest: Identifiable {
    let id: String
    let name: String
    let category: String
    let coordinate: CLLocationCoordinate2D
    let distance: Double

    var imageName: String {
        switch category {
        case "SIGHTS": return "monument"
        case "NIGHTLIFE": return "nightlife"
        case "RESTAURANT": return "restaurant"
        case "SHOPPING": return "shopping"
        default: return "placeholder"
        }
    }
}
