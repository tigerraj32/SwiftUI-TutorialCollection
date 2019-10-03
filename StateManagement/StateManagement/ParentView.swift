import SwiftUI
import Published_ObservedObject

public struct ParentView: View {
    @State private var name: String = ""
    @State private var rate: Int = 0
    
    public init() {}
    
    public var body: some View {
        VStack(alignment: .leading) {
            
            Text("@State and @Binding")
                .bold()
            Group {
                Text("Text in TextField: ")
                Text(name)
                RTTextField(text: $name, placeholder: "Enter text here")
            }.padding(.bottom)
            
            
            Text("@State and @Binding with custom Rating View").bold()
            Group {
                RatingView(rate: $rate)
            }.padding(.bottom)
            
            Text("@Published, @ObservedObject, ObservableObject").bold()
            Group {
                PublishedView()
            }.padding(.bottom)
            
            Spacer()
        }.padding(.leading)
        
    }
}


struct RTTextField: View {
    @Binding var text: String
    var placeholder: String
    var body: some View {
        Group {
            TextField(placeholder, text: $text)
                .foregroundColor(.green)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding(12)
        
        
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ParentView()
        }
        
    }
}






