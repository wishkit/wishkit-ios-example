//
//  SheetExampleView.swift
//  wishkit-ios-example
//
//  Created by Martin Lasek on 10/31/23.
//  Copyright © 2023 Martin Lasek. All rights reserved.
//

import SwiftUI
import WishKit

struct SheetExampleView: View {
    @State
    private var showingSheet = false

    var body: some View {
        NavigationStack {
            Button(action: { showingSheet = true }, label: { Text("Show Wishlist") })
                .sheet(isPresented: $showingSheet) {
                    WishKit.view.withNavigation()
                }
        }
    }
}
