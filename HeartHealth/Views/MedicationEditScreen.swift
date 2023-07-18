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
    @State var nameField = ""
    @Binding var isPresenting: Bool

    
    let idToGet: UUID
    var body: some View {
        
        let medication = medications.first(where: {$0.id == idToGet})
        
        
        
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                Text("Medication Name")
                    .fontWeight(.semibold)
                    .font(.system(size: 17, design: .rounded))
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundColor(Color(UIColor.systemGroupedBackground))
                    
                    
                    TextField("Input a name", text: $nameField)
                        .padding(.horizontal)
                        .onReceive(nameField.publisher.collect()) {
                            nameField = String($0.prefix(50))
                        }
                    
                }
                .frame(maxWidth: 350, maxHeight: 40)
                .padding()
                
                Text("Dosage")
                    .fontWeight(.semibold)
                    .font(.system(size: 17, design: .rounded
                                 ))
                Spacer()
                
                
                
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Edit Medication")
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        
                        

                        medication?.name = $nameField.wrappedValue
                        
                        try? viewContext.save()
                        
                        
                        
                        isPresenting = false
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        
                        isPresenting = false
                        
                    }
                }
                
            }
            .padding()
            
    
        }
        
        .onAppear() {
            nameField = medication?.name ?? ""

        }
    }
}

struct MedicationEditScreen_Previews: PreviewProvider {
    static var previews: some View {
        MedicationEditScreen(isPresenting: .constant(true), idToGet: UUID())
    }
}
