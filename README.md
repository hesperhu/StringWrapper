使用propertyWrapper来内建数据模型的处理逻辑

# 需求

封装string仅存储前几位字符，并且需要支持双向binding

# 步骤

## 构建String的wrapper

```swift
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
```

## 在view中像使用@State一样使用wrapper

```swift
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
```

## 效果

![hsw_2023-02-26_10.31.09](/media/16773783744914/hsw_2023-02-26_10.31.09.png)

