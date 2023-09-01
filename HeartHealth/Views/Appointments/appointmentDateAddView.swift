//
//  AppointmentDateAddView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-08-13.
//

import SwiftUI

struct AppointmentDateAddView: View {
    
    var category: String
    
    @State var date = Date()
    
    var body: some View {
        
        VStack {
            Text("When will this appointment be?")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            Text($date.wrappedValue, style: .date)
                .font(.custom("LeagueSpartan-Regular", size: 24))
            Text($date.wrappedValue, style: .time)
                .font(.custom("LeagueSpartan-Regular", size: 20))
            
            
            
            DatePicker("", selection: $date)
                .datePickerStyle(.graphical)
            
            NavigationLink(destination: AppointmentNameAdd(category: category, date: date)) {
                Text("Next")
                    .frame(width: 320)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            
        }
        .padding()
    }
}

struct AppointmentDateAddView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentDateAddView(category: "test")
    }
}
