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
    @State var dosageField: Double = 0.0
    @State var dosageUnitField = "mg"
    @State var purposeField = ""
    @State var notesField = ""
    @State var dosageFrequencyField = "Daily"
    @State var timesPerDayField = ""
    @State var medicationCustomFrequencyField = ""
    
    @Binding var isPresenting: Bool

    
    let idToGet: UUID
    
    let dosageUnits = ["mg", "g", "mcg", "mL", "%"]
    
    let dosageIntervals = ["Daily", "As Needed", "Custom"]
    

    
    var body: some View {
        
        let medication = medications.first(where: {$0.id == idToGet})
        
        
        
    NavigationStack {
            
             ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("Medication Name")
                        .fontWeight(.semibold)
                        .font(.system(size: 17, design: .rounded))
                        .padding(.leading)
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 13)
                            .foregroundColor(Color(UIColor.systemGray6))
                        
                        
                        TextField("Input a name", text: $nameField)
                            .padding(.horizontal)
                            .onReceive(nameField.publisher.collect()) {
                                nameField = String($0.prefix(50))
                            }
                        
                    }
                    .frame(width: 350, height: 40)
                    .padding([.horizontal, .bottom])
                    
                    Text("Dosage")
                        .fontWeight(.semibold)
                        .font(.system(size: 17, design: .rounded))
                        .padding(.leading)
                    
                    
                    HStack {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 13)
                                .foregroundColor(Color(UIColor.systemGray6))
                            TextField("Input an amount", value: $dosageField, format: .number)
                                .keyboardType(.decimalPad)
                                .padding(.leading)
                        }
                        .frame(width: 111, height: 41)
                        
                        
                        ZStack(alignment: .leading) {
                            
                            RoundedRectangle(cornerRadius: 13)
                                .foregroundColor(Color(uiColor: .systemGray6))
                            Picker("Select a Dosage Unit", selection: $dosageUnitField) {
                                ForEach(dosageUnits, id: \.self) {
                                    unit in
                                    Text("\(unit)")
                                }
                            }
                            .pickerStyle(.segmented)
                            
                            
                        }
                        .frame(width: 211, height: 41)
                        
                    }
                    .padding([.horizontal, .bottom])
                    
                    Group {
                        Text("Purpose")
                            .fontWeight(.semibold)
                            .font(.system(size: 17, design: .rounded))
                            .padding(.leading)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 13)
                                .foregroundColor(Color(uiColor: .systemGray6))
                            TextField("Why do you take this medication?", text: $purposeField)
                                .onReceive(purposeField.publisher.collect()) {
                                    self.purposeField = String($0.prefix(30))
                                }
                                .padding(.leading)
                            
                        }
                        .frame(width: 339, height: 41)
                        .padding([.horizontal, .bottom])
                        
                        
                        Text("Notes")
                            .fontWeight(.semibold)
                            .font(.system(size: 17, design: .rounded))
                            .padding(.leading)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 13)
                                .foregroundColor(Color(uiColor: .systemGray6))
                            TextField("Write some notes", text: $notesField)
                                .onReceive(notesField.publisher.collect()) {
                                    self.notesField = String($0.prefix(150))
                                    
                                }
                                .padding(.leading)
                            
                            
                        }
                        .frame(width: 339, height: 83)
                        .padding(.leading)
                        
                    }
                  
                
            
                    
                 
                    Group {
                        
                        
                        Text("Schedule")
                            .fontWeight(.semibold)
                            .font(.system(size: 17, design: .rounded))
                            .padding(.leading)
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 13)
                                .foregroundColor(Color(uiColor: .systemGray6))
                            
                            Picker("Select a freqeuncy", selection: $dosageFrequencyField) {
                                ForEach(dosageIntervals, id: \.self) {
                                    interval in
                                    Text("\(interval)")
                                }
                            }
                            .padding(-10)
                            .pickerStyle(.inline)
                            
                        }
                        .frame(width: 339, height: 80)
                        .padding(.leading)
                        
                        
                        
                        
                        
                        if($dosageFrequencyField.wrappedValue == "Daily") {
                            HStack {
                                Text("Times per day: ")
                                    .font(.system(size: 17, design: .rounded))
                                    .padding([.leading, .top])
                                
                                TextField("How many times per day?", text: $timesPerDayField)
                                    .padding([.top])
                                    .keyboardType(.numberPad)
                                    .frame(width: 70)
                                    .textFieldStyle(.roundedBorder)
                                  
                                        
                                    }
                                
                            }
                        
                        
                        if($dosageFrequencyField.wrappedValue == "Custom") {
                            
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 13)
                                    .foregroundColor(Color(uiColor: .systemGray6))
                                
                                
                                VStack {
                                    TextField("Enter some notes", text: $medicationCustomFrequencyField, axis: .vertical)
                                        .padding([.top, .leading])
                                        .onReceive(medicationCustomFrequencyField.publisher.collect()) {
                                            self.medicationCustomFrequencyField = String($0.prefix(150))
                                        }
                                    Spacer()
                                }
                                   
                            }
                            .frame(width: 339, height: 150)
                            .padding(.leading)
                            
                        }
                        
                        
                    }
                    
                    
                }
                 
                
            }
             .toolbar {
                 ToolbarItem(placement: .principal) {
                     Text("Edit Medication")
                         .fontWeight(.bold)
                 }
                 ToolbarItem(placement: .confirmationAction) {
                     Button("Done") {
                         
                         

                         medication?.name = $nameField.wrappedValue
                         medication?.dosage = $dosageField.wrappedValue
                         medication?.dosageUnit = $dosageUnitField.wrappedValue
                         medication?.purpose = $purposeField.wrappedValue
                         medication?.notes = $notesField.wrappedValue
                         
                         
                         if($dosageFrequencyField.wrappedValue == "Custom") {
                             medication?.dosageFrequency = $medicationCustomFrequencyField.wrappedValue
                         } else {
                             if($dosageFrequencyField.wrappedValue == "Daily") {
                                 medication?.dosageFrequency = "Every Day"
                                 
                             } else {
                                 medication?.dosageFrequency = $dosageFrequencyField.wrappedValue
                             }
                         }
                         
               
                         
                         if($dosageFrequencyField.wrappedValue == "As Needed") {
                             medication?.timesPerDay = -1
                             
                         } else {
                             
                             if($dosageFrequencyField.wrappedValue == "Custom") {
                                 medication?.timesPerDay = -1
                             } else {
                                 medication?.timesPerDay = Int32($timesPerDayField.wrappedValue) ?? 0
                             }
                             
                         }
                         
                        
                         
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
    
        }
        
        .onAppear() {
            nameField = medication?.name ?? ""
            dosageField = medication?.dosage ?? 0
            dosageUnitField = medication?.dosageUnit ?? ""
            purposeField = medication?.purpose ?? ""
            notesField = medication?.notes ?? ""

            if(medication?.dosageFrequency == "Every Day") {
                dosageFrequencyField = "Daily"
                
            }else {
                if(medication?.dosageFrequency == "As Needed") {
                    dosageFrequencyField = "As Needed"
                } else {
                    dosageFrequencyField = "Custom"
                    medicationCustomFrequencyField = medication?.dosageFrequency ?? ""

                }
            }
            
            timesPerDayField = String(medication?.timesPerDay ?? 0)
            

        }
    }
}

struct MedicationEditScreen_Previews: PreviewProvider {
    static var previews: some View {
        MedicationEditScreen(isPresenting: .constant(true), idToGet: UUID())
    }
}
