//
//  MenuItemView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-16.
//

import SwiftUI

struct MenuItemView: View {
    
    
    var title: String
    var strColor: Color
    var image: String
    
    var body: some View {
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .shadow(radius: 3, y: 3)
                .foregroundColor(.white)
            
            HStack {
                Image(systemName: image)
                    .font(.system(size: 36, weight: .light))
                    .foregroundColor(strColor)
                    
                Text(title)
                    .font(Font.custom("LeagueSpartan-Regular", size: 20))
                Spacer()
            }
            .padding(.horizontal)
            
        }
        .frame(width: 350, height: 75)
        
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(title: "Medications", strColor: .blue, image: "pills")
    }
}
