//
//  ContentView.swift
//  StringWrapper
//
//  Created by hesper on 2023-02-26(Sun).
//

import SwiftUI

struct ContentView: View {
    @FixedString(count: 6) var textHello: String = "hello world"
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            TextField("hello", text: self.$textHello)
            
            Text(textHello)
            
        }
        .padding()
    }

}


