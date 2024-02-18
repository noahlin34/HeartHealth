//
//  AppointmentAddInformationView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2024-02-17.
//

import SwiftUI

struct AppointmentAddInformationView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var appointments: FetchedResults<Appointment>
    
    
    //defining previous variables to persist data
    var date: Date
    var name: String
    var category: String
    var location: String
    var inPersonLocation: String
    @State var questions: String
    
    @Binding var isPresentingAddMedication: Bool

    
    var body: some View {
        
        
        VStack() {
            Text("Any last touches?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            ZStack() {
                
                if questions.isEmpty {
                   
                        Text("Write any questions to ask or final notes")
                        .frame(width: 250)
                            .padding()
                }
                
                VStack {
                    Spacer()
                    TextEditor(text: $questions)
                        .opacity(questions.isEmpty ? 0.25: 1 )
                        .frame(width: 300, height: 400)
                        .padding()
                    Spacer()
                }.overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.gray, lineWidth: 2)
                    .frame(width: 300, height: 400)
                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/))
                
                    
            }

        }
        
        Button {
            let appointment = Appointment(context: viewContext)
            appointment.id = UUID()
            appointment.date = date
            appointment.category = category
            appointment.notes = $questions.wrappedValue
            
            try? viewContext.save()
            isPresentingAddMedication = false
        } label: {
             Text("Finish")
                .frame(width: 300)
        }
        .buttonStyle(.borderedProminent)
        .padding(.bottom)

    }
}

#Preview {
    AppointmentAddInformationView(date: Date(), name: "test", category: "test", location: "test", inPersonLocation: "test", questions: "", isPresentingAddMedication: .constant(true))
}
