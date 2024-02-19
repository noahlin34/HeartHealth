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
    
    @State var customCategory: String
    
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
                        ZStack {
                            
                            if customCategory.isEmpty {
                                Text("Eg. surgery consult, other")
                            }
                            
                            TextEditor(text: $customCategory)
                                .padding(.horizontal)
                                .frame(maxHeight: 300)
                                .opacity(customCategory.isEmpty ? 0.25: 1 )
                         

                            .frame(maxHeight: 200)
                        }
                            
                    }
                }
                
                
                //this if statement changes the navigationLink to pass a different category variable depending on if it is custom or not.
                if category == "Custom" {
                    NavigationLink(destination: AppointmentDateAddView(category: customCategory, isPresentingAddMedication: $isPresentingAddMedication)) {
                        Text("Next")
                            .frame(width: 320)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    
                    Spacer()
                } else {
                    NavigationLink(destination: AppointmentDateAddView(category: category, isPresentingAddMedication: $isPresentingAddMedication)) {
                        Text("Next")
                            .frame(width: 320)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    
                    Spacer()
                }
                
                
               
            }
            .padding()
        }
        
    }
}

struct AppointmentInitialAddView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentInitialAddView(isPresentingAddMedication: .constant(true), customCategory: "")
    }
}
