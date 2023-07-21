//
//  ContactNotesAddView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-20.
//

import SwiftUI

struct ContactNotesAddView: View {
    
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var contacts: FetchedResults<Contact>
    
    
    
    
    @State var notesField = ""
    @Binding var isPresentingMedicationAddView: Bool
    
    let nameToAdd: String
    let positionToAdd: String
    let phoneToAdd: String
    let phoneExtensionToAdd: Int64
    let email: String
    
    
    var body: some View {
        
        VStack {
            
            Text("Any notes you want to add?")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("E.g, department, clinic, etc. ", text: $notesField, axis: .vertical)
                .onReceive(notesField.publisher.collect()) {
                    notesField = String($0.prefix(250))
                }
                .padding()
            
            
            Button{
                
                let contact = Contact(context: viewContext)
                
                contact.id = UUID()
                contact.name = nameToAdd
                contact.number = phoneToAdd
                contact.email = email
                contact.numberExtension = phoneExtensionToAdd
                contact.position = positionToAdd
                contact.notes = notesField
                
                try? viewContext.save()
                
                isPresentingMedicationAddView = false
                
            } label: {
                Text("Finish")
                    .frame(width: 300)

            }
            .buttonStyle(.borderedProminent)
            
            
            Spacer()
        }
        .padding()
        
        
    }
}

struct ContactNotesAddView_Previews: PreviewProvider {
    static var previews: some View {
        ContactNotesAddView(isPresentingMedicationAddView: .constant(true), nameToAdd: "", positionToAdd: "", phoneToAdd: "", phoneExtensionToAdd: 0, email: "")
    }
}
