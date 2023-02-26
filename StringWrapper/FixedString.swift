//
//  FixedString.swift
//  StringWrapper
//
//  Created by hesper on 2023-02-26(Sun).
//

import Foundation
import Combine
import SwiftUI

@propertyWrapper
struct FixedString: DynamicProperty {
    
    private var fixedCount: Int
    @State private  var value: String
    //构建wrapper属性
    var wrappedValue: String {
        get {return value}
        set {value = fixedString(string: newValue)}
    }
    //wrapper的初始化
    init(wrappedValue value: String, count: Int) {
        self.fixedCount = count
        self.value = String(value.prefix(self.fixedCount))
    }
    //构建binding，这样就可以$来引用
    var projectedValue: Binding<String> {
        Binding(get: {value}, set: {value = fixedString(string: $0)})
    }
    //处理逻辑
    private func fixedString(string: String) -> String{
        return String(string.prefix(fixedCount))
    }
}

//https://www.swiftbysundell.com/articles/property-wrappers-in-swift/
//https://www.donnywals.com/writing-custom-property-wrappers-for-swiftui/
//https://www.hackingwithswift.com/plus/intermediate-swiftui/creating-a-custom-property-wrapper-using-dynamicproperty
