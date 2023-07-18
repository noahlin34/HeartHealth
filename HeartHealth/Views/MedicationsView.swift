//
//  MedicationsView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-15.
//

import SwiftUI

struct MedicationsView: View {
    let persistenceController = PersistenceController.shared

    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var medications: FetchedResults<Medication>
    @State var isPresentingAddMedication = false
    
    
    
    var body: some View {
        
       
            ScrollView {
                
                HStack {
                    Image(systemName: "pills")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                    Text("Medications")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding([.top, .leading])
                if(medications.isEmpty) {
                    VStack {
                        Spacer()
                        Text("Whoops, you have no medications! Try tapping the Add button in the top right!")
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                            .padding()
                        Spacer()
                    }
     
                    
                }
                ForEach(medications) {
                    medication in
                    
                    
                    NavigationLink(destination: MedicationDetailView(idToGet: medication.id ?? UUID()).environment(\.managedObjectContext, persistenceController.container.viewContext)) {
                        MedicationLabelView(medicationName: medication.name ?? "", medicationDosage: medication.dosage , medicationDosageUnit: medication.dosageUnit ?? "")
                            .padding(.horizontal)
                    }
                    .buttonStyle(.plain)
                    
                }
                
                Spacer()
             
                .padding()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        isPresentingAddMedication = true
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddMedication) {
                MedicationAddView(isPresentingAddMedication: $isPresentingAddMedication)
                    .interactiveDismissDisabled()

            }
            .background(Color(uiColor: .systemGray6))
            
        }
        
        
        
    
}

struct MedicationsView_Previews: PreviewProvider {
    static var previews: some View {

        
        
        MedicationsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
