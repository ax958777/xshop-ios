//
//  RegistrationView.swift
//  xshop
//
//  Created by AlexX on 2024-12-06.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm=RegistrationViewModel()
    @State var presentAlert=false
    @State var errorMessage="Something went wrong"
    var body: some View {
        
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
                    TextField("Enter your Fullname", text:$vm.name)
                        .modifier(TextFieldModifier())
                        .autocapitalization(.none)
                    SecureField("Enter your password",text:$vm.password)
                        .modifier(TextFieldModifier())
                        .autocapitalization(.none)
                }
                
                Button
                {
                    Task{
                        do{
                            try await vm.register()
                            dismiss()
                        }
                        catch{
                            self.presentAlert=true
                        }
                    }
                }
                label:{
                    Text("Sign Up")
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
                
                Button{
                    dismiss()
                } label: {
                    HStack(spacing:3){
                        Text("Already have an account?")
                        Text("Sign In")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        .font(.footnote)
                    }
                }
            }
            
        }
   
}

#Preview {
    RegistrationView()
}
