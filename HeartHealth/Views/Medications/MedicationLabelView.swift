//
//  MedicationLabelView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-15.
//

import SwiftUI

struct MedicationLabelView: View {
     var medicationName: String
    var medicationDosage: Double
    var medicationDosageUnit: String
    
    

    var body: some View {

        
        ZStack {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .foregroundColor(.white)
                .shadow(radius: 3, y: 3)
            VStack {
                HStack {
                    
                    Text("\(medicationName)")
                        .font(Font.custom("LeagueSpartan-Regular", size: 20))
                    Spacer()
                    Text("\(medicationDosage.formatted()) \(medicationDosageUnit)")
                        .font(Font.custom("LeagueSpartan-Regular", size: 20))
                }
                .padding()
            }
        }
        .frame(width: 360, height: 60)
    }
}

struct MedicationLabelView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationLabelView(medicationName: "Aspirin", medicationDosage: 2.3, medicationDosageUnit: "mg")
    }
}
