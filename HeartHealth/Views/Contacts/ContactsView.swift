//
//  ContactsView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-19.
//

import SwiftUI

struct ContactsView: View {
    let persistenceController = PersistenceController.shared
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var contacts:
    FetchedResults<Contact>
    
    @State var isPresentingContactAddScreen = false
    
    
    var body: some View {
        
        ScrollView {
                
                HStack {
                    Image(systemName: "stethoscope")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.mint, .gray)
                        .font(.largeTitle)
                    Text("Health Care Team")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                    Spacer()
                    
                }
                .padding([.top, .leading])
                
            if(contacts.isEmpty) {
                VStack {
                    Text("Hmm, no contacts.")
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()

                         
                }
            }
            
            
            ForEach(contacts) {
                contact in
                
                NavigationLink(destination: ContactDetailView(idToGet: contact.id ?? UUID()).environment(\.managedObjectContext, persistenceController.container.viewContext)) {
                    ContactLabelView(name: contact.name ?? "", position: contact.position ?? "")
                }
                .buttonStyle(.plain)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Add") {
                    isPresentingContactAddScreen = true
                }
            }
        }
        .sheet(isPresented: $isPresentingContactAddScreen) {
            ContactNameAddView(isPresentingMedicationAdd: $isPresentingContactAddScreen)
                .interactiveDismissDisabled()
        }
        .padding()
        
        
        
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
