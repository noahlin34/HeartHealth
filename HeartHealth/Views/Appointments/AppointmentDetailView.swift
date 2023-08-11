//
//  AppointmentDetailView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-26.
//

import SwiftUI

struct AppointmentDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let persistenceController = PersistenceController.shared

    let appointment: Appointment
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.green)
                    .font(.system(size: 32))
                VStack(alignment: .leading) {
                    Text(appointment.category ?? "catetgorynotfound")
                        .font(.system(size: 20, design: .rounded))
                    .fontWeight(.bold)
                    
                    Text(appointment.date ?? Date(), style: .date)
                        .fontWeight(.bold)
                        .font(.system(size: 20, design: .rounded))
                    
                    Text(appointment.time ?? "timenotfound")
                        .fontWeight(.bold)
                        .font(.system(size: 20, design: .rounded))
                }
              
                
                Spacer()
            }
            .padding(.bottom)
            
            
            Text("Details")
                .fontWeight(.bold)
                .font(.system(size: 20, design: .rounded))
                .padding()
            
            HStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading) {
                        Text(appointment.category ?? "category not found")
                            .font(.custom("LeagueSpartan-Regular", size: 20))
                        Divider()
                            .frame(width: 288)
                            .foregroundColor(.black)
                        Text(appointment.location ?? "locationnotfound")
                            .font(.custom("LeagueSpartan-Regular", size: 20))
                    }
                }
                .frame(width: 339, height: 145)
                Spacer()
            }
            
            Text("Questions/Concerns")
                .fontWeight(.bold)
                .font(.system(size: 20, design: .rounded))
                .padding()
            
            HStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundColor(.white)
                    
                    
                    HStack {
                        Text(appointment.questions ?? "questionsnotfound")
                            .font(.custom("LeagueSpartan-Regular", size: 20))
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .frame(width: 339, height: 85)

                Spacer()
            }
            
            Text("Notes")
                .font(.system(size: 20, design: .rounded))
                .fontWeight(.bold)
                .padding()
            
            HStack {
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundColor(.white)
                    
                    HStack {
                        Text(appointment.notes ?? "couldn't find notes")
                            .padding(.horizontal)
                            .font(.custom("LeagueSpartan-Regular", size: 20))
                        Spacer()
                    }
                        
                }
                .frame(width: 339, height: 85)
                Spacer()
            }
            
            
            
            Spacer()
        
            
            
            
        }
        .padding()
        .background(Color(.systemGroupedBackground))

    }
}

struct AppointmentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        let appointment = Appointment(context: viewContext)
        
        appointment.id = UUID()
        appointment.category = "Surgery"
        
        
       return AppointmentDetailView(appointment: appointment)
    }
}
