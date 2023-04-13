import SwiftUI

struct ContentView: View {
    
    @State var name: String = ""
    @State var validName: Bool = true
    @State var lastname: String = ""
    @State var validLastname: Bool = true
    
    var body: some View {
        VStack {
            TextField("Insert your name", text: $name)
                .padding(50)
                .foregroundColor(validName ? .green : .red)
            TextField ("Insert your lastname", text: $lastname)
                .padding(50)
                .foregroundColor(validLastname ? .green : .red)
            Button("Button") {
                print("Hola \(name) \(lastname)")
                print("Hola" + name + " " + lastname)
                validName = name.count > 10
                validLastname = lastname.count > 10
            }
            Text(name)
                .font(.title)
                .foregroundColor(.cyan)
            HStack{
                Text(lastname)
                    .font(.headline)
                    .foregroundColor(.indigo)
            }
            
                    }
        }
    }

