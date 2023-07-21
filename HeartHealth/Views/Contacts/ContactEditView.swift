//
//  ContactEditView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-20.
//

import SwiftUI

struct ContactEditView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    let persistenceController = PersistenceController.shared
    
    let contact: Contact
    
    @Binding var isPresenting: Bool
    
    @State var nameField =  ""
    @State var positionField = ""
    @State var phoneField = ""
    @State var extensionField = ""
    @State var emailField = ""
    @State var notesField = ""

    
    var body: some View {

        NavigationStack {
            ScrollView {
                    VStack(alignment: .leading) {
                        
                        Text("Details")
                            .font(.system(size: 17, design: .rounded))
                            .fontWeight(.semibold)
                            .padding()
                        
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 13)
                                .foregroundColor(Color(uiColor: .systemGray6))
                                .frame(width: 339, height: 52)
                            
                            TextField("Input a name", text: $nameField)
                                .padding(.leading)
                        }
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 13)
                                .foregroundColor(Color(uiColor: .systemGray6))
                                .frame(width: 339, height: 52)
                            
                            
                            TextField("Input a position", text: $positionField)
                                .padding(.leading)
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 13)
                                .foregroundColor(Color(uiColor: .systemGray6))
                                .frame(width: 339, height: 52)
                            
                            TextField("Phone number", text: $phoneField)
                                .padding(.leading)
                        }
                        
                        HStack {
                            Text("Extension: ")
                                .font(.system(size: 17, design: .rounded))
                            ZStack {
                                RoundedRectangle(cornerRadius: 13)
                                    .foregroundColor(Color(uiColor: .systemGray6))
                                    .frame(width: 211, height: 53)
                                
                                TextField("ext", text: $extensionField)
                                    .padding(.leading, 30)
                                
                            }
                        }
                        .padding()
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 13)
                                .foregroundColor(Color(uiColor: .systemGray6))
                                .frame(width: 339, height: 52)
                            
                            TextField("Email address", text: $emailField)
                                .padding(.leading)
                            

                        }
                        
                        
                        Text("Notes")
                            .font(.system(size: 17, design: .rounded))
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 13)
                                .foregroundColor(Color(uiColor: .systemGray6))
                                .frame(width: 339, height: 200)
                            
                            VStack {
                                TextField("Add some notes", text: $notesField, axis: .vertical)
                                    .padding()
                                Spacer()
                            }
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                    .padding()
                    
                }
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            
                            
                            contact.name = nameField
                            contact.email = emailField
                            contact.notes = notesField
                            contact.number = phoneField
                            contact.numberExtension = Int64(extensionField) ?? -1
                            contact.position = positionField
                            
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
                .onAppear() {
                    nameField = contact.name ?? ""
                    positionField = contact.position ?? ""
                    phoneField = contact.number ?? ""
                    
                    if contact.numberExtension == -1 {
                        extensionField = ""
                    } else {
                        extensionField = String(contact.numberExtension)

                    }
                    emailField = contact.email ?? ""
                    notesField = contact.notes ?? ""
                    
                
            }
        }
        
        
        
        
        
    }
}

struct ContactEditView_Previews: PreviewProvider {
    
    
    
    
    static var previews: some View {
        
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        let contact = Contact(context: viewContext)
        contact.name = "joe"
        contact.id = UUID()
        contact.email = "nglin34@gmail.com"
        
        return ContactEditView(contact: contact, isPresenting: .constant(true))
    }
}
