//
//  MedicationDetailLabelView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-16.
//

import SwiftUI

struct MedicationDetailLabelView: View {
    
    let dosage: Double
    let dosageUnit: String
    let notes: String
    let purpose: String
    
    
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
                .shadow(radius: 3, y: 3)
            
            
            VStack {
                HStack {
                    Text("\(dosage.formatted())")
                        .font(Font.custom("LeagueSpartan-Regular", size: 20))

                    Text("\(dosageUnit)")
                        .font(Font.custom("LeagueSpartan-Regular", size: 20))

                    Spacer()
                }
                
                Divider()
                HStack {
                    Text("\(purpose)")
                        .font(Font.custom("LeagueSpartan-Regular", size: 20))
                    Spacer()
                }
                Divider()
                HStack {
                    Text("\(notes)")
                        .font(Font.custom("LeagueSpartan-Regular", size: 20))
                    Spacer()
                }
            }
            .padding()
            
        }
        .padding(.top, -10)
        .frame(minWidth: 350, maxWidth: 350, minHeight: 0, maxHeight: 400)
        
        
    }
}

struct MedicationDetailLabelView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationDetailLabelView(dosage: 5, dosageUnit: "mg", notes: "Brand name is Eliquis", purpose: "Keeps me alive")
    }
}
