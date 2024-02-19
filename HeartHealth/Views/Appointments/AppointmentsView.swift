//
//  AppointmentsView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-22.
//

import SwiftUI

struct AppointmentsView: View {
    
    let persistenceController = PersistenceController.shared

    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var appointments: FetchedResults<Appointment>
    @State var isPresentingAddView = false;
    
    
    
    
    var body: some View {

        ScrollView {
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.green)
                    .font(.system(size: 32))
                Text("Appointments")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                Spacer()
            }
            .padding()
            
            ForEach(appointments) {
                appointment in
                NavigationLink(destination: AppointmentDetailView(appointment: appointment)) {
                    AppointmentCardView(appointment: appointment)
                }
                .buttonStyle(.plain)
            }
            
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                
                Button("Add") {
                    isPresentingAddView = true;
                }
                
            }
        }
        .sheet(isPresented: $isPresentingAddView) {
            AppointmentInitialAddView(isPresentingAddMedication: $isPresentingAddView, customCategory: "")
        }


    }
}

struct AppointmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
