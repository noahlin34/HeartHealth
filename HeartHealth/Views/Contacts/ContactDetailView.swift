//
//  ContactDetailView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-20.
//

import SwiftUI

struct ContactDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss

    let persistenceController = PersistenceController.shared

    @FetchRequest(sortDescriptors: []) var contacts:
    FetchedResults<Contact>
    @State var showAlert = false

    let idToGet: UUID
    
    
    @State var isPresentingEditView = false
    
    
    
    var body: some View {
        
        
        let contact = contacts.first(where: {$0.id == idToGet})
        
       
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "stethoscope")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.mint, .gray)
                        .font(.system(size: 20))
                    
                    Text("\(contact?.name ?? "nonamefound")")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding()
                
                Text("Details")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.leading)
                
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 13)
                            .foregroundColor(.white)
                            .shadow(radius: 3, y: 3)
                            .frame(width: 339, height: 214)

                        VStack {
                            HStack {
                                Text("\(contact?.position ?? "positionnotfound")")
                                    .font(.custom("LeagueSpartan-Regular", size: 20))
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(.leading)
                            
                            Divider()
                                .frame(width: 300)
                            
                            VStack {
                                HStack {
                                    
                                    let numberString = contact?.number ?? "1234567891"
                                    
                                    let digits = Array(numberString)
                                    
                                    
                                    if digits.count == 10 {
                                        let slice1 = String(digits[0...2])
                                        let slice2 = String(digits[3...5])
                                        let slice3 = String(digits[6...9])
                                        
                                        let formattedPhone = String("\(slice1)-\(slice2)-\(slice3)")
                                        
                                        if let phoneURL = URL(string: "tel://\(numberString)") {
                                            Link(formattedPhone, destination: phoneURL)
                                                .font(Font.custom("LeagueSpartan-Regular", size: 20))

                                        }
                                    } else {
                                        Text("\(numberString)")
                                    }
                                    
                                 
                                    
                                    
                                  
                                    Spacer()
                                    
                                    
                                }
                                
                                HStack {
                                    
                                    
                                    
                                    
                                    let extensionString = String(contact?.numberExtension ?? 1203)
                                    
                                   
                                    
                                    if(contact?.numberExtension == -1) {
                                       Text("Ext: None")
                                    } else {
                                        Text("Ext: \(extensionString)")
                                            .font(Font.custom("LeagueSpartan-Regular", size: 20))

                                    }
                                    
                                    Spacer()
                                }
                            }
                            .padding([.leading])

                            
                            Divider()
                                .frame(width: 300)
                            
                            let stringEmail = contact?.email ?? "nglin34@gmail.com"
                            
                            
                            HStack {
                                Link(stringEmail, destination: URL(string: "mailto:\(stringEmail)")!)
                                    .font(Font.custom("LeagueSpartan-Regular", size: 20))

                                
                                
                                Spacer()
                            }
                            .padding(.leading)
                            
                        }
                        .padding(.leading)
                        
                        
                    }
                    
                        
                     
                        Spacer()
                    }
                
                
                
                Text("Notes")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding([.leading, .top])
                
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 13)
                            .frame(width: 339, height: 200)
                            .foregroundColor(.white)
                            .shadow(radius: 3, y: 3)
                        
                        VStack {
                          
                                Text("\(contact?.notes ?? "werosafdsdfasdfasdfasdfasdfasdfasdfasdfasdfadsfweriojwer")")
                                    .font(Font.custom("LeagueSpartan-Regular", size: 20))
                                    .padding()
                            
                        }
                        
                        
                        
                        
                        .padding()
                        
                    }
                    
                
                  
            
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Button{
                        showAlert = true
                    } label: {
                        Text("Delete Contact")
                            .foregroundColor(.red)
                            .frame(width: 300)
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                }
                .padding(.top)
                
                    Spacer()
                }
                .padding()

                .toolbar {
                    ToolbarItem {
                        Button("Edit") {
                            isPresentingEditView = true
                        }
                    }
                }

                .sheet(isPresented: $isPresentingEditView) {
                    ContactEditView(contact: contact!, isPresenting: $isPresentingEditView).environment(\.managedObjectContext, persistenceController.container.viewContext)
                }
                .background(Color(uiColor: .systemGroupedBackground))
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Delete Contact"), message: Text("Are you sure you want to delete this contact entry? This can not be undone."),
                    
                          primaryButton: .default(Text("Cancel"), action: {
                        
                    }),
                          secondaryButton: .destructive(Text("Delete"),
                                                        action: {
                        viewContext.delete(contact!)
                        try? viewContext.save()
                        dismiss()
                    })
                    )
                }
            
            }
            
            

        
        
    
}

struct ContactDetailView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ContactDetailView( idToGet: UUID())
    }
}
