//
//  RegisterButtonView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-28.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct RegisterButtonView: View {
//    MARK: - PROPERTIES
    
    @State private var showingAlert = false
    @State private var showMainView = false
    @State private var errorDescription: String = ""
    
    @Binding var email: String
    @Binding var password: String
    @Binding var re_password: String
    
    @State var alertType: RegAlerts? = nil
    
//    MARK: - BODY
    var body: some View {
        
        Button {
            
            hideKeyboard()
            validateFields()
        } label: {
            Text("sign on")
                .modifier(ActionButtonModifier())
                .background(Colors.buttonBackgroundColor)
                .foregroundColor(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
                )
        }
        .fullScreenCover(isPresented: $showMainView) { MainTabView(recipeVM: RecipeListViewModel(), searchVM: SearchViewModel()) }
        .alert(isPresented: $showingAlert, content: {
            getAlert()
        })
    }
    
    func getAlert() -> Alert {
        
        switch alertType {
            
        case .isEmailEmpty:
            return Alert(title: Text("Error..."), message: Text("Email must be provided"), dismissButton: .default(Text("OK")))
        case .isPasswordValid:
            return Alert(title: Text("Error..."), message: Text("Please make sure your password is at least 8 characters, contains a special character and number"), dismissButton: .default(Text("OK")))
        case .isPasswordsNotSame:
            return Alert(title: Text("Error..."), message: Text("Please enter the same password in the \"password\" and \"confirm password\" fields"), dismissButton: .default(Text("OK")))
        case .success:
            return Alert(title: Text("Success..."), message: Text("You are successfully registered!"), dismissButton: .default(Text("OK"), action: {
                registerUser()
                showMainView.toggle()
            }))
        default:
            return Alert(title: Text(""))
        }
    }
    
    func validateFields() {
        
        if email.isEmpty {
            
            alertType = .isEmailEmpty
            showingAlert.toggle()
        }
        else if Utilities.isPasswordValid(password) == false || password.isEmpty {

            alertType = .isPasswordValid
            showingAlert.toggle()
        }
        else if password != re_password {

            alertType = .isPasswordsNotSame
            showingAlert.toggle()
        }
        else {
            
            alertType = .success
            showingAlert.toggle()
        }
    }
    
    func registerUser() {

        if showingAlert {

        } else {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    
                    errorDescription = error!.localizedDescription
                    print("ERROR!!! \(errorDescription)")
                    print("USER DATA: \(email) \(password)")
                } else {
                    
                    let dataBase: DatabaseReference!
                    dataBase = Database.database().reference(withPath: "users").child(result!.user.uid).child("credentials")
                    dataBase.setValue(["email" : email])
                    
                }
            }
        }
    }
}

//  MARK: - PREVIEW

//struct RegisterButtonView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        RegisterButtonView()
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
