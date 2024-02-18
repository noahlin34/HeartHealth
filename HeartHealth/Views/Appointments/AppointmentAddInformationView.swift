//
//  AppointmentAddInformationView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2024-02-17.
//

import SwiftUI

struct AppointmentAddInformationView: View {
    
    
    //defining previous variables to persist data
    var date: Date
    var name: String
    var category: String
    var location: String
    var inPersonLocation: String
    @State var questions: String
    
    
    
    var body: some View {
        TextField("Input any questions you want to remember to ask", text: $questions)
    }
}

#Preview {
    AppointmentAddInformationView(date: Date(), name: "test", category: "test", location: "test", inPersonLocation: "test", questions: "")
}
