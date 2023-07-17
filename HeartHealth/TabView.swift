//
//  TabView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-16.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
