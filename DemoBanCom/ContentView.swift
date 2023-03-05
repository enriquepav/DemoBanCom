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
            VStack {
                Spacer()
                HStack {
                    Spacer()
                        .frame(width: 15)
                    Text("Bienvenido")
                        .font(.custom("Roboto-Medium",
                                      size: 16))
                    Spacer()
                }
                HStack {
                    Spacer()
                        .frame(width: 15)
                    Text("Inicia Sesión")
                        .font(.custom("Roboto-Medium",
                                      size: 32))
                        .fontWeight(.black)
                    Spacer()
                }
                Spacer()
                    .frame(height: 30)

                    
                TextField("Correo Electrónico", text: $username)
                        .modifier(LoginModifier())
                Spacer()
                    .frame(height: 10)
                
                    
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
                        Image(systemName: self.showPassword ? "eye.slash.fill" : "eye.fill")
                            .font(.system(size: 20, weight: .regular)
                            ).foregroundColor(.gray)
                            .padding()
                    })
                }
                
                HStack {
                    Spacer()
                    Button("¿Olvidaste la contraseña?"){
                    //ToDo
                    }
                    .font(.custom("Roboto-Medium",size: 14))
                    .foregroundColor(CustomColor.personalColor1)
                    .frame(alignment: .trailing)
                }
               
                
                HStack {
                    Toggle(isOn: $isChecked) {
                        Text("Recordar correo")
                            .font(.custom("Roboto-Medium",size: 14))
                            .fontWeight(.bold)
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Button(action: {
                                    //TODO
                                }, label: {
                                    
                                    Text("Ingresar")
                                        .font(.custom("Roboto-Medium", fixedSize: 14))
                                        .fontWeight(.black)
                                        .foregroundColor(.white)
                                        .frame(width: 320)
                                        .padding()
                                        .background(CustomColor.personalColor2)
                                        .cornerRadius(10)
                                    
                                })
                    
                    Button(action: {
                                    //TODO
                                }, label: {
                                    HStack (alignment: .center){
                                        Image("googleIcon")
                                        Text("Ingresar con Google")
                                            .font(.custom("Roboto-Medium", fixedSize: 14))
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                    .frame(width: 350)
                                    .background(CustomColor.personalColor3)
                                    .cornerRadius(10)
                                    
                                }).padding()
                }
                
                
                
                
                
                
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
                .frame(width: 360)
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {

            RoundedRectangle(cornerRadius: 4.0)
                .stroke(lineWidth: 8)
                .frame(width: 25, height: 25)
                .cornerRadius(4.0)
                .foregroundColor(CustomColor.personalColor2)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "").foregroundColor(CustomColor.personalColor2)
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
