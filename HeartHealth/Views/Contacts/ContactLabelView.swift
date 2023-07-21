//
//  ContactLabelView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-19.
//

import SwiftUI

struct ContactLabelView: View {
    
    let name: String
    let position: String
    
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 13)
                .foregroundColor(.white)
                .shadow(radius: 3, y: 3)

            VStack(alignment: .leading) {
                
                Text("\(name)")
                    .font(.custom("LeagueSpartan-Regular", size: 20))
                Text("\(position)")
                    .font(.custom("LeagueSpartan-Regular", size: 20))
                    .padding(.top, 0.3)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        
            
        }
        .frame(width: 339, height: 84, alignment: .leading)
        .padding()
        
    }
}

struct ContactLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ContactLabelView(name: "Dr. Joe", position: "Cardiologist")
    }
}
