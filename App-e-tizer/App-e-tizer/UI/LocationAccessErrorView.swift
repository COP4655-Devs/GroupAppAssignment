//
//  LocationAccessErrorView.swift
//  App-e-tizer
//
//  Created by Daniel Condly on 11/21/22.
//

import SwiftUI

struct LocationAccessErrorView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("This application requires location access.")
                .padding(.bottom, 10)
            Button("Settings") {
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: nil)
                }
            }
            Spacer()
        }

    }
}

struct LocationAccessErrorView_Previews: PreviewProvider {
    static var previews: some View {
        LocationAccessErrorView()
    }
}
