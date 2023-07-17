//
//  MedicationDetailView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-16.
//

import SwiftUI

struct MedicationDetailView: View {
    let persistenceController = PersistenceController.shared

    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss


    @FetchRequest(sortDescriptors: []) var medications: FetchedResults<Medication>
    
    @State var showAlert = false
    @State var showingEdit = false

    let name: String

    
    
    
    var body: some View {
        
        let medication = medications.first(where: {$0.name?.caseInsensitiveCompare(name) == .orderedSame})
        
        
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "pills")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    
                    Text("\(medication?.name ?? "name not loaded")")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding()
                
                
                Text("Details")
                    .fontWeight(.bold)
                    .font(.system(size: 25, design: .rounded))
                    .padding(.leading)
                
                HStack {
                    Spacer()
                    MedicationDetailLabelView(dosage: medication?.dosage ?? 0, dosageUnit: medication?.dosageUnit ?? "unitnotload", notes: medication?.notes ?? "No Notes", purpose: medication?.purpose ?? "purposenoload")
                    Spacer()
                }
                
                
                Text("Schedule")
                    .fontWeight(.bold)
                    .font(.system(size: 25, design: .rounded))
                    .padding([.leading, .top])
                
                HStack {
                    Spacer()

                    MedicationScheduleLabelView(dateAdded: medication?.dateAdded ?? Date(), frequency: medication?.dosageFrequency ?? "nofrequency", timesperDay: medication?.timesPerDay ?? 0)
                    Spacer()

                }
                
                
                
                Spacer()
                
                
                HStack {
                    Spacer()
                    Button {
                        
                        showAlert = true
                        
                        
                    }
                
                    label: {
                        Text("Delete Medication")
                            .font(Font.custom("LeagueSpartan-Regular", size: 20))

                            .frame(width: 250, height: 30)
                            .foregroundColor(.red)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.white)
                    .shadow(radius: 3, y: 3)
                    Spacer()
                }
                .padding(.top)
                
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Archive Medication")
                            .font(Font.custom("LeagueSpartan-Regular", size: 20))
                            .foregroundColor(.blue)
                            .frame(width: 250, height: 30)
                        
                    }
                    .tint(.white)
                    .shadow(radius: 3, y: 3)
                    .buttonStyle(.borderedProminent)
                    Spacer()
                }
                
                
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Delete Medication"),
                      message: Text("Are you sure you want to delete this medication entry? This can not be undone."),
                      primaryButton: .default(Text("Cancel"),
                                              action: {
                    
                    
                    
                    
                }),
                      secondaryButton: .destructive(Text("Delete"),
                                                    action: {
                    viewContext.delete(medication!)
                    try? viewContext.save()
                    dismiss()
                })
                )
                
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Edit") {
                        showingEdit = true
                    }
                }
            }
            .sheet(isPresented: $showingEdit) {
                MedicationEditScreen(name: name).environment(\.managedObjectContext, persistenceController.container.viewContext)
                
        }
        }
        
    
        
        
        
    }

}

struct MedicationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationDetailView(name: "Aspirin")
    }
}