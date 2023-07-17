//
//  MedicationEditScreen.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-17.
//

import SwiftUI

struct MedicationEditScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    let persistenceController = PersistenceController.shared

    
    @FetchRequest(sortDescriptors: []) var medications: FetchedResults<Medication>
    
    
    let name: String
    var body: some View {
        
        let medication = medications.first(where: {$0.name?.caseInsensitiveCompare(name) == .orderedSame})
        
        
        
        NavigationStack {
            VStack(alignment: .leading) {
                
                Text("Medication Name")
                    .fontWeight(.bold)
                    .font(.system(size: 18, design: .rounded))
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(Color(UIColor.systemGroupedBackground))
                    
                    
                    Text("\(medication?.name ?? "namenoload")")
                        .padding( )
                }
                .frame(maxWidth: 350, maxHeight: 40)
                
                Spacer()
                
                
                
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Edit Medication")
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        
                    }
                }
        }
        }
    }
}

struct MedicationEditScreen_Previews: PreviewProvider {
    static var previews: some View {
        MedicationEditScreen(name: "Aspirin")
    }
}
