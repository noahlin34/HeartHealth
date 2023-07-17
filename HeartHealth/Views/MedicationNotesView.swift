//
//  MedicationNotesView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-15.
//

import SwiftUI

struct MedicationNotesView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var medications: FetchedResults<Medication>
    @Binding var isPresentingAddMedication: Bool
    
    @State var notes: String = ""
    
    var name: String
    var dosage: Double
    var dosageUnit: String


    var dosageFrequency: String
    var timesPerDay: Int32
    var purpose: String
    
    var body: some View {
        VStack {
            Text("Any final thoughts?")
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(.vertical)
            
            TextField("Add some notes", text: $notes, axis: .vertical)
                .lineLimit(5...10)
                .onReceive(notes.publisher.collect()) {
                    self.notes = String($0.prefix(100))
                }
                .padding(40)
            
            Button {
                
                let medication = Medication(context: viewContext)
                
                medication.id = UUID()
                medication.name = name
                medication.dosage = dosage
                medication.dosageUnit = dosageUnit
                medication.dosageFrequency = dosageFrequency
                medication.timesPerDay = timesPerDay
                medication.purpose = purpose
                medication.dateAdded = Date()
                
                
                medication.notes = notes
                
                try? viewContext.save()
                
                isPresentingAddMedication = false
                
                
            } label: {
                Text("Finish")
                    .frame(width: 300)

            }
            .buttonBorderShape(.roundedRectangle)
            .buttonStyle(.borderedProminent)
            
            
            Spacer()
        }
        .padding()
    }
}

struct MedicationNotesView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationNotesView(isPresentingAddMedication: .constant(true), name: "Aspirin", dosage: 2.3, dosageUnit: "mg", dosageFrequency: "Every Day", timesPerDay: 2, purpose: "Does Stuff")
    }
}
