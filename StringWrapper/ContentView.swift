//
//  ContentView.swift
//  StringWrapper
//
//  Created by hesper on 2023-02-26(Sun).
//

import SwiftUI

struct ContentView: View {
//    @State var count = 0
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
    
    func hello(_ count: Int) -> String{
        @FixedString(count: count) var textHello: String = "hello world"
        return textHello
    }
}


