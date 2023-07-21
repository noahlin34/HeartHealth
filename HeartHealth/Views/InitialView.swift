//
//  InitialView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-16.
//

import SwiftUI




struct InitialView: View {
    
    
    @State var home = UUID()
    @State var profile = UUID()
    @State var tabSelection = 1
    @State var tappedTwice = false
 @State var selectedTab = 1
    
    var body: some View {
       

        
        
        var theHandler: Binding<Int> {
            Binding(
                get: {self.selectedTab},
                set: {
                    if $0 == self.selectedTab {
                        
                        if(self.selectedTab == 1) {
                            home = UUID()
                            print("saem tab")
                        }
                        
                    }
                    self.selectedTab = $0
                }
            
            )
        }
        
        
        TabView(selection: theHandler) {
            NavigationView {
                HomeView()
                    .id(home)
                   
            }
            .tabItem {
                Image(systemName: "house")
            }
            .tag(1)
            
            
            NavigationView {
                ProfileView()
                    .id(profile)
            }
            .tabItem {
                Image(systemName: "person")
            }
            .tag(2)
            
        }
        
        
        
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
