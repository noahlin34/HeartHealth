//
//  AppointmentInitialAddView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-08-13.
//

import SwiftUI

struct AppointmentInitialAddView: View {
    
    @Binding var isPresentingAddMedication: Bool
    
    @State var category = "Testing"
    
    @State var customCategory = "E.g: Check up, medical review, etc."
    
    let categoryOptions = ["Testing", "Check-Up", "Procedure", "Custom"]
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("What kind of appointment is this?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Picker("Select", selection: $category) {
                    ForEach(categoryOptions, id: \.self) {
                        category in
                        Text(category)
                    }
                }
                .pickerStyle(.inline)
                
                if(category == "Custom") {
                    VStack {
                        TextEditor(text: $customCategory)
                            .background(Color(uiColor: .systemGroupedBackground))
                            .padding(.horizontal)
                            
                    }
                }
                
                NavigationLink(destination: AboutView()) {
                    Text("Next")
                        .frame(width: 320)
                }
                .buttonStyle(.borderedProminent)
                
                
                Spacer()
            }
        }
        
    }
}

struct AppointmentInitialAddView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentInitialAddView(isPresentingAddMedication: .constant(true))
    }
}
