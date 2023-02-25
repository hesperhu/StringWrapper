//
//  FixedString.swift
//  StringWrapper
//
//  Created by hesper on 2023-02-26(Sun).
//

import Foundation

@propertyWrapper
struct FixedString {
    
    private var fixedCount: Int
    private var value: String
    
    var wrappedValue: String {
        get {return value}
        set {value = String(newValue.prefix(self.fixedCount))}
    }
    
    init(wrappedValue value: String, count: Int) {
        self.fixedCount = count
        self.value = String(value.prefix(self.fixedCount))
    }
}

//https://www.swiftbysundell.com/articles/property-wrappers-in-swift/
