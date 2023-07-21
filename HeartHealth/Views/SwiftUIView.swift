//
//  SwiftUIView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-19.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var test = ""
    
    var body: some View {
        
        TextField("input", text: $test) {
            Text("\(test)")
            
        }
        .onChange(of: test) {
            value in
            if(test == "Test") {
                test = "wer"
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
