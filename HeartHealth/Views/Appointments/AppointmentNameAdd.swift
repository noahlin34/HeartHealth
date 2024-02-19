//
//  AppointmentNameAdd.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-08-24.
//

import SwiftUI

struct AppointmentNameAdd: View {
    
    
    var category: String
    var date: Date
    @Binding var isPresentingAddMedication: Bool

    @State var name = ""
    
    
    
    
    var body: some View {
        VStack {
            Text("What is the name of the healthcare provider?")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
            
            ZStack {
                
                if name.isEmpty {
                    Text("Enter the name here")
                }
                
                TextEditor(text: $name)
                    .frame(maxHeight: 132)
                    .opacity(name.isEmpty ? 0.25: 1)
            }
            
            
            
            NavigationLink(destination: AppointmentLocationAddView(date: date, name: name, category: category, isPresentingAddMedication: $isPresentingAddMedication)) {
                Text("Next")
                    .frame(width: 320)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            
            
            
        }
        .padding()
    }
}

struct AppointmentNameAdd_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentNameAdd(category: "testcategory", date: Date(), isPresentingAddMedication: .constant(true))
    }
}
