//
//  SingleRecipeView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-21.
//

import SwiftUI

struct SingleRecipeView: View {
    
    @EnvironmentObject private var authServices: AuthServices
    @EnvironmentObject private var webServices: WebServices
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let selectedRecipe: Recipe
    @State private var isUserLogged: Bool = false
    @State private var isShowAlert: Bool = false
    @State private var showLoginView: Bool = false
    
    var body: some View {
        
        ZStack {
            fullBackground(imageName: "backYellow")
            VStack {
                ZStack {
                    Rectangle()
                        .stroke(Color.accentColor, lineWidth: 1)
                        .frame(width: screenWidth - 1, height: (screenHeight * 0.3) + 1)
                    AsyncImage(url: URL(string: selectedRecipe.thumbnail_url)) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: screenWidth - 2, height: screenHeight * 0.3, alignment: .center)
                    } placeholder: {
                        ProgressView("Loading...")
                            .padding()
                            .frame(width: screenWidth - 2, height: screenHeight * 0.3, alignment: .center)
                            .font(.system(size: 13))
                            .tint(.white)
                            .background(Color(UIColor(white: 0.3, alpha: 0.7)))
                            .foregroundColor(.white)
                    }
                    .clipShape(Rectangle())
                    .overlay(
                        Text("\(selectedRecipe.name)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.accentColor)
                            .multilineTextAlignment(.leading)
                            .shadow(radius: 4)
                            .padding(10)
                            .background(
                                Color.white
                                    .cornerRadius(8)
                                    .opacity(0.6)
                            )
                            .padding()
                        , alignment: .topLeading
                    )
                }
                if selectedRecipe.calories != nil && selectedRecipe.calories != 0 {
                    NutritionView(recipe: selectedRecipe)
                        .padding(.horizontal)
                        .padding(.top, 10)
                }
                if selectedRecipe.description != "" {
                    DescriptionView(recipe: selectedRecipe)
                        .padding(.horizontal)
                        .padding(.top, 10)
                }
                ScrollView(.vertical, showsIndicators: false) {
                    Text(selectedRecipe.instructions)
                        .font(.callout)
                } .padding()
                    .foregroundStyle(Color.accentColor)
                    .frame(width: screenWidth)
                Spacer()
                SingleRecipeToolBar(selectedRecipe: selectedRecipe)
                    .frame(alignment: .bottom)
            }
            .onAppear {
                if selectedRecipe.instructions == "" { isShowAlert.toggle() }
                DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                    if authServices.authState == .notAuthorised { isUserLogged.toggle() }
                }
            }
            .alert(isPresented: $isShowAlert) { Alert(title: Text("Sorry..."), message: Text("The instruction for this recipe is not available.\nYou can watch video instruction."), dismissButton: .default(Text("OK")))
            }
        }
        .alert("To save and access your favorite recipes, you must be logged in.", isPresented: $isUserLogged) {
            
            Button("Log In", role: .destructive, action: {
                
                self.showLoginView.toggle()
            })
            
            Button("Dismiss", role: .cancel, action: {})
        }
        .onDisappear {
            webServices.favoriteArray.removeAll()
            DispatchQueue.main.async {
                webServices.checkFavDataEmpty()
            }
            
        }
        .fullScreenCover(isPresented: $showLoginView) { LoginView() }
    }
}

#Preview {
    SingleRecipeView(selectedRecipe: Recipe())
}
