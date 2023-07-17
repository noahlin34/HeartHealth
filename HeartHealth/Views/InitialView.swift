//
//  InitialView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-16.
//

import SwiftUI

struct InitialView: View {


    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                    }
                AboutView()
                    .tabItem {
                        Image(systemName: "questionmark.circle")
                    }
            }
            
            
        }
        
    }
        
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
