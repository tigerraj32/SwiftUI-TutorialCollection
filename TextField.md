
## Litening to textfield change in SwiftUI.

When we implement the search feature, we first normally input string of text via textfield or UISearchBar Text field. 
Either way whenever the user inpur character delegate or call back is invoked. So if we are using network call or file 
read to find filtered result, it could eventually turnout very expensive. Because for every change there is a network call.

We can overcome this problem by firing network call after some time when user paused the text input action by using **debounce** and **sink**

### debounce
Publishes elements only after a specified time interval elapses between events.

### sink
Attaches a subscriber with closure-based behavior.

### removeDuplicates
Publishes only elements that don’t match the previous element.

```swift
class UserInput: ObservableObject {
    @Published var str: String = ""
    init() {
        let _ = $str.debounce(for: .seconds(1.0), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { (str) in
                print(str)
        }
    }
}


struct ContentViewTest: View {
    @ObservedObject var input = UserInput()
    var body: some View {
      return (
            VStack{
                TextField("Type Something", text: $input.str)
        })
    }
}
```
