//
//  MedicationScheduleLabelView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-16.
//

import SwiftUI

struct MedicationScheduleLabelView: View {
    
    
    let dateAdded: Date
    let frequency: String
    let timesperDay: Int32
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
                .shadow(radius: 3, y: 3)
            
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(frequency)")
                            .font(Font.custom("LeagueSpartan-Regular", size: 20))
                            .padding(.bottom, 0.1)
                        if(timesperDay != -1) {
                            Text("\(timesperDay) times per day")
                                .font(Font.custom("LeagueSpartan-Regular", size: 20))

                        }
                        
                    }
                    
                    Spacer()
                }
                
                Divider()
                HStack {
                        Text("Added on \(dateAdded.formatted(.dateTime.day().month().year()))")
                        .font(Font.custom("LeagueSpartan-Regular", size: 16))
                    Spacer()
                }
             
            }
            .padding()
            
        }
        .frame(width: 350, height: 150    )
    }
}

struct MedicationScheduleLabelView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationScheduleLabelView(dateAdded: Date(), frequency: "Every Day", timesperDay: 3)
    }
}
