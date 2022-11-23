//
//  ListCell.swift
//  App-e-tizer
//
//  Created by Daniel Condly on 11/21/22.
//

import SwiftUI

struct ListCell: View {
    @Environment(\.colorScheme) var colorScheme

    @State var imageName: String
    @State var name: String
    @State var category: String
    @State var distance: Double

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .aspectRatio(contentMode: .fit)
                .frame(width: 30.0, height: 30.0)

            VStack {
                HStack {
                    Text(name)
                    Spacer()
                }.padding([.top, .bottom], 6)

                HStack {
                    Text(category)
                        .foregroundColor(.gray)
                    Spacer()
                    if let formattedDistance = self.formattedDistance {
                        Text(formattedDistance)
                            .foregroundColor(.gray)
                    }
                }
            }.padding(.leading, 10)
        }
        .padding([.leading, .trailing, .bottom], 10)
        .background(Color.gray.opacity(0.2))
    }

    var formattedDistance: String? {
        var unit = "km"
        var maximumFractionDigits = 2
        if distance < 1000 {
            unit = "m"
            maximumFractionDigits = 0
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = maximumFractionDigits
        if let distance = formatter.string(from: NSNumber(value: distance)) {
            return "\(distance)\(unit) away"
        }
        return nil
    }

}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(imageName: "placeholder",
                 name: "Marsel",
                 category: "Nightlife",
                 distance: 1020)
            .preferredColorScheme(.dark)
    }
}
