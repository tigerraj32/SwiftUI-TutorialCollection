## ViewModifier

There are time when we need to add same modifier to number of similar view component. In order to aviod duplicate code, we can create a custom view modifier that encapsulate all the changes.

If you want to make your own, define a struct that conforms to the ViewModifier protocol. This protocol requires that you accept a body(content:) method that transforms some sort of content however you want, returning the result.


![](custom.modifier.png)
> Here we need to make a curcular text label that shows A, B, C.  Then normal approach will be we create three text for A, B, C and apply same modifier for all text as below.

```swift
struct CustomViewModifier: View {
    var body: some View {
        HStack {
            Text("A")
                .padding()
                .background(Color.red)
                .foregroundColor(Color.white)
                .clipShape(Circle())
            
            Text("B")
                .padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .clipShape(Circle())
            
            Text("B")
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .clipShape(Circle())
            
        }
    }
}
```

> By Using ViewModifier we can reduce and reuse view modifier code.

```swift
struct TextModifier: ViewModifier {
    var background = Color.red
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(background)
            .foregroundColor(Color.white)
            .clipShape(Circle())
    }
}
```

> We can now use TextModifier as below

```swift
struct CustomViewModifier: View {
    var body: some View {
        HStack {
            Text("A")
                 .modifier(TextModifier(background: Color.red))
            
            Text("B")
                 .modifier(TextModifier(background: Color.green))
            
            Text("B")
                .modifier(TextModifier(background: Color.blue))
            
        }
    }
}
```

We can also create a `extension` for `Text` to use modifier as below

```swift
extensoin Text {
    func roundText(){
    self.modifier(CustomViewModifier())
    }
}

 Text("B").roundText()
 
```




