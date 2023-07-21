//
//  HomeView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-16.
//

import SwiftUI

struct HomeView: View {
    let persistenceController = PersistenceController.shared



    
    

    var body: some View {
        
       
        
            ScrollView {
                HStack {
                    Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    Text("Heart Health")
                        .font(.system(size: 36, design: .rounded))
                        .fontWeight(.bold)
                    Spacer()
                        
                }
                .padding()
                
                
                
                VStack {
                    
                    NavigationLink(destination: MedicationsView()    .environment(\.managedObjectContext, persistenceController.container.viewContext)

                        ) {
                        MenuItemView(title: "Medications", strColor: .blue, image: "pills")
                    }
                    .isDetailLink(false)
                    .buttonStyle(.plain)
                    .padding(.top)
                    
                    NavigationLink(destination: MedicationsView()    .environment(\.managedObjectContext, persistenceController.container.viewContext)

                        ) {
                        MenuItemView(title: "Appointments", strColor: .red, image: "calendar")
                    }
                    .buttonStyle(.plain)
                    .padding(.top)

                    
                  


                    
                    NavigationLink(destination: ContactsView().environment(\.managedObjectContext, persistenceController.container.viewContext)

                        ) {
                        MenuItemView(title: "Medical Contacts", strColor: .mint, image: "stethoscope")
                    }
                    .buttonStyle(.plain)
                    .padding(.top)
                    
                    NavigationLink(destination: MedicationsView()    .environment(\.managedObjectContext, persistenceController.container.viewContext)

                        ) {
                        MenuItemView(title: "Medical History", strColor: .purple, image: "list.clipboard")
                    }
                    .buttonStyle(.plain)
                    .padding(.top)

                    NavigationLink(destination: MedicationsView()    .environment(\.managedObjectContext, persistenceController.container.viewContext)

                        ) {
                        MenuItemView(title: "Notes", strColor: .gray, image: "book")
                    }
                    .buttonStyle(.plain)
                    .padding(.top)
                    
                }
                
            }
            .background(Color(.systemGray6))

        }
        
        
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
