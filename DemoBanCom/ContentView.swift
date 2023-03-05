//
//  ContentView.swift
//  DemoBanCom
//
//  Created by MAC1DIGITAL20 on 4/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @FocusState var focus1: Bool
    @FocusState var focus2: Bool
    @State var showPassword: Bool = false
    @State var text: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("Bienvenido")
                    .font(.custom("Roboto-Medium",
                                  size: 16))
                
                Text("Iniciar Sesión")
                    .font(.custom("Roboto-Medium",
                                  size: 30))
                    .fontWeight(.bold)
                
                TextField("Correo Electrónico", text: $username)
                    .padding ()
                    .modifier(LoginModifier())
                    .frame (width: 300, height: 50)
                    .background(Color.white.opacity(0.85))
                    .cornerRadius (10)
                    .border(.red, width: CGFloat(wrongUsername))
                
                
                ZStack(alignment: .trailing) {
                    TextField("Password", text: $text)
                        .modifier(LoginModifier())
                        .textContentType(.password)
                        .focused($focus1)
                        .opacity(showPassword ? 1 : 0)
                    SecureField("Password", text: $text)
                        .modifier(LoginModifier())
                        .textContentType(.password)
                        .focused($focus2)
                        .opacity(showPassword ? 0 : 1)
                    Button(action: {
                        showPassword.toggle()
                        if showPassword { focus1 = true } else { focus2 = true }
                    }, label: {
                        Image(systemName: self.showPassword ? "eye.slash.fill" : "eye.fill").font(.system(size: 16, weight: .regular))
                            .padding()
                    })
                }
                
                Button("¿Olvidaste la contraseña?") {
                    
                }.font(.custom("Roboto-Medium",size: 14)).foregroundColor(.brown)
                
                
                
            }.navigationBarHidden(true)
        }
    }
    
struct LoginModifier: ViewModifier {

    var borderColor: Color = Color.gray

    func body(content: Content) -> some View {
            content
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(borderColor, lineWidth: 1))
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
