//
//  AppointmentCardView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-26.
//

import SwiftUI

struct AppointmentCardView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let persistenceController = PersistenceController.shared
    
    let appointment: Appointment
    let formatter = DateFormatter()

    var body: some View {
 
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 13)
                .foregroundColor(.white)
                .shadow(radius: 3, y:3)
            
            
            VStack {
                HStack {
                    Text(appointment.date ?? Date(), style: .date)
                        .font(.custom("LeagueSpartan-Regular", size: 20))
                    Spacer()
                    Text(appointment.time ?? "3:10 pm")
                        .font(.custom("LeagueSpartan-Regular", size: 20))
                }
                HStack {
                    Text(appointment.category ?? "Surgery")
                        .font(.custom("LeagueSpartan-Regular", size: 20))
                    Spacer()
                }
            }
            .padding()
        }
        .frame(width: 339, height: 89)
    }
}

struct AppointmentCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        let appointment = Appointment(context: viewContext)
        appointment.id = UUID()
        appointment.category = "surgery"
        appointment.date = Date()
        appointment.location = "8 Spanhouse  Crescent"
        appointment.time = "3:10 pm"
        
        
        return AppointmentCardView(appointment: appointment)
    }
}
