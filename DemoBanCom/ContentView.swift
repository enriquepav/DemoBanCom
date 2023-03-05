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
    @State private var isChecked = false
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("Bienvenido")
                    .font(.custom("Roboto-Medium",
                                  size: 16))
                
                Text("Inicia Sesión")
                    .font(.custom("Roboto-Medium",
                                  size: 30))
                    .fontWeight(.bold)
                
                TextField("Correo Electrónico", text: $username)
                    .modifier(LoginModifier())
                    
                
                
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
                
                Button("¿Olvidaste la contraseña?"){
                    
                }
                .font(.custom("Roboto-Medium",size: 14))
                .foregroundColor(CustomColor.personalColor1)
                
                HStack {
                    Toggle(isOn: $isChecked) {
                        Text("Recordar correo")
                            .font(.custom("Roboto-Medium",size: 14))
                            .fontWeight(.bold)
                    }
                    .toggleStyle(CheckboxToggleStyle())
                }
                .padding()
                
                
                
                
                
                
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

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {

            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 2)
                .frame(width: 25, height: 25)
                .cornerRadius(5.0)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
            configuration.label
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
