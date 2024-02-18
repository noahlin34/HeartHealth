//
//  AppointmentLocationAddView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-08-24.
//

import SwiftUI

struct AppointmentLocationAddView: View {
    
    
    
    var date: Date
    var name: String
    var category: String
    
    @State var location = "In Person"
    @State var inPersonLocation = ""
    
    let locationOptions = ["In Person", "Online", "Telephone"]

    
    
    var body: some View {
        
        VStack {
            Text("How will this appointment take place?")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Picker("Select", selection: $location) {
                ForEach(locationOptions, id: \.self) {
                    option in
                    Text(option)
                }
            }
            .pickerStyle(.wheel)

            
            if($location.wrappedValue == "In Person") {
                
                TextField("Input a location", text: $inPersonLocation)
                    .padding(.leading)
            }
            
            
            if($location.wrappedValue == "Online") {
                TextField("Input the link you access this appointment", text: $inPersonLocation)
            }
            
            if($location.wrappedValue == "Telephone") {
                TextField("Input the number you call", text: $inPersonLocation)
                    .keyboardType(.asciiCapableNumberPad)
            }
            
            NavigationLink(destination: AppointmentAddInformationView(date: date, name: name, category: category, location: location, inPersonLocation: inPersonLocation, questions: "")) {
                Text("Next")
                    .frame(width: 320)
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
            Spacer()

        }
        .padding()
    }
}

struct AppointmentLocationAddView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentLocationAddView(date: Date(), name: "nameforthis", category: "categoryforthis")
    }
}
