//
//  Login.swift
//  xshop
//
//  Created by AlexX on 2024-12-04.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm=LoginViewModel()
    @State private var presentAlert = false
    @State private var errorMessage: String="Something went wrong."
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("login")
                    .resizable()
                    .scaledToFit()
                    .frame(width:120,height:120)
                    .padding()
                VStack{
                    TextField("Enter your email", text:$vm.email)
                        .modifier(TextFieldModifier())
                        .autocapitalization(.none)
                    SecureField("Enter your password",text:$vm.password)
                        .modifier(TextFieldModifier())
                        .autocapitalization(.none)
                }
                NavigationLink{
                    ForgotPasswordView()
                        .navigationBarBackButtonHidden(true)
                } label:{
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing,28)
                        .foregroundColor(.black)
                        .frame(maxWidth:.infinity,alignment: .trailing)
                }
                Button
                {
                    Task{
                        do{
                            try await vm.login()
                        }
                        catch{
                            self.presentAlert=true
                        }
                    }
                }
                label:{
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352,height:44)
                        .background(.black)
                        .cornerRadius(8)
                }
                .alert("Error",
                       isPresented: $presentAlert,
                       
                       presenting: $errorMessage,
                       
                       actions: { detail in
                    
                    Button("OK", action: {})
                }, message: { detail in
                    
                    Text(errorMessage)
                })
                
                Spacer()
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing:3){
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
            }
            
        }
        
    }
}

#Preview {
    LoginView()
}
