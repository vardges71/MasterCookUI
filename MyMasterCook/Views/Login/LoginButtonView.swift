//
//  LoginButtonView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-10.
//

import SwiftUI
import FirebaseAuth

struct LoginButtonView: View {
    
//    MARK: - PROPERTIES
    
    var user: User
    @State private var showingAlert = false
    @State private var showMainView = false
    @State private var errorDescription: String = ""
    
//    MARK: - BODY
    
    var body: some View {
        Button {
            
            checkUser()
            hideKeyboard()
            
        } label: {
            Text("sign in")
                .modifier(ActionButtonModifier())
                .background(Colors.buttonBackgroundColor)
                .foregroundColor(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
                )
        }
        .alert(isPresented: self.$showingAlert) { Alert(title: Text("Error..."), message: Text("\(errorDescription)"), dismissButton: .default(Text("OK"))) }
        .fullScreenCover(isPresented: $showMainView) { MainTabView(recipeVM: RecipeListViewModel(), searchVM: SearchViewModel(), favoritesListVM: FavoritesListViewModel()) }
    }
    
    func checkUser(){
        
        Auth.auth().signIn(withEmail: user.email, password: user.password) { (result, error) in
            
            if error != nil {
                
                self.showingAlert.toggle()
                self.errorDescription = error!.localizedDescription
            } else {
                
                showMainView.toggle()
                print("User logged in \(user.email)")
            }
        }
    }
}

//  MARK: - PREVIEW

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView(user: User())
    }
}
