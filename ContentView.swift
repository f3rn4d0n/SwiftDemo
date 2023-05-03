import SwiftUI

struct ContentView: View {
    
    @State var name: String = ""
    @State var validName: Bool = true
    @State var password: String = ""
    @State var validPassword: Bool = true
    @State var saveCredentials: Bool = false
    @State var loginSuccess: Bool = false
    
    var body: some View {
        NavigationView{
            VStack {
                Image("cocina")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                VStack {
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
                            .foregroundColor(validPassword ? .orange : .cyan)
                        
                        Divider()
                            .frame(height: 2)
                            .overlay(Color.cyan)
                    }
                    HStack{
                        Toggle("", isOn: $saveCredentials)
                            .dynamicTypeSize(.medium)
                            .frame(width: 40, alignment: .leading)
                            .foregroundColor(.orange)
                        Spacer()
                        Text("Recordarme")
                            .font(.footnote)
                        Spacer()
                        Text("¿Olvidaste tu contraseña?")
                            .font(.footnote)
                        
                    }
                    Button("Iniciar Sesion"){
                        loginSuccess = Logica().validateCredentials(email: name, password: password, stored: saveCredentials)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.orange)
                }.padding()
                Spacer()
                NavigationLink(destination: SecondView(), isActive: $loginSuccess) {
                }
                Text("Terminos y condiciones")
            }
            .onAppear{
                let credentias = Logica().getCredentials()
                name = credentias.email
                password = credentias.password
                if !name.isEmpty {
                    saveCredentials = true
                }
            }
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

