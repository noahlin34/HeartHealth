//
//  ProfileView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-16.
//

import SwiftUI

struct ProfileView: View {
    let persistenceController = PersistenceController.shared
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var user:
    FetchedResults<User>
    @State private var username: String = ""
    
    
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Text("Welcome Back,")
                    .font(.system(size: 36, design: .rounded))
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading)
           
            ForEach(user) {
                user in
                Text(user.name ?? "")
                    .font(.system(size: 36, design: .rounded))
                    .fontWeight(.bold
                    )
            }
            
          
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
