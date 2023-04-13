import SwiftUI

struct ContentView: View {
    
    @State var name: String = ""
    @State var validName: Bool = true
    @State var password: String = ""
    @State var validLastname: Bool = true
    
    var body: some View {
        NavigationView{
            VStack {
                Image("cocina")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                VStack {
                    HStack {
                        Text("Insert your name")
                            .font(.callout)
                        Spacer()
                        
                    }
                    TextField("Insert your name", text: $name)
                        .foregroundColor(validName ? .orange : .cyan)
                    
                    Divider()
                        .frame(height: 2)
                        .overlay(Color.cyan)
                    HStack{
                        Text("Insert your password")
                            .font(.callout)
                        Spacer()
                    }
                    SecureField ("Insert your password", text: $password)
                        .foregroundColor(validName ? .orange : .cyan)
                    
                    Divider()
                        .frame(height: 2)
                        .overlay(Color.cyan)
                }
                HStack{
                    Toggle("", isOn: $validLastname)
                        .dynamicTypeSize(.medium)
                        .frame(width: 40, alignment: .leading)
                        .foregroundColor(.orange)
                    Spacer()
                    Text("Recordarme")
                        .font(.headline)
                    Spacer()
                    Text("¿Olvidaste tu contraseña?")
                        .font(.headline)
                    
                }
                
                Button("Iniciar Sesion"){
                    validLastname = Logica().validateCredentials(email: name, password: password)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.orange)
                .padding()
                
                
                Spacer()
                NavigationLink(destination: SecondView(), isActive: $validLastname) {
                }
                Text("Terminos y condiciones")
               
                
            }
            .navigationTitle("Navigation")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
    }
    
    
    
}

