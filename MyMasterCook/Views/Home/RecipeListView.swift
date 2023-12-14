//
//  RecipeListView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-31.
//

import SwiftUI

struct RecipeListView: View {
    
    //    MARK: - PROPERTIES
    
    @State private var selection: Recipe? = nil
    @State private var shouldAnimate = false
    @State private var isShowAlert = false
    
    @Binding var tabSelection: Int
    @StateObject var recipeListVM: RecipeListViewModel
    
    //    MARK: - BODY
    
    var body: some View {
        
        VStack {
            
            if $recipeListVM.recipeArray.isEmpty {
                
                ZStack {

                    ActivityIndicator(shouldAnimate: $shouldAnimate)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                        .background( Color.black.opacity(0.7) )
                        .onChange(of: recipeListVM.recipeArrayEmpty) { newValue in
                            isShowAlert = newValue
                            withAnimation {
                                tabSelection = 1
                            }
                        }
                    Text("Loading...")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .tint(.white)
                        .padding(.top, 50)
                }
            } else {
                
                List(recipeListVM.recipeArray, id: \.id) { recipe in
                    
                    RecipeCellView(recipe: recipe)
                        .onTapGesture { selection = recipe }
                        .animation(.default, value: true)
                        .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    
                } //: LIST
                .scrollContentBackground(.hidden)
                .sheet(item: $selection,
                       onDismiss: { selection = nil }) { recipe in
                    SingleRecipeView(recipe: recipe)
                }
            }
        } //: VStack
        .onAppear {
            checkRecipeDataEmpty()
            if recipeListVM.recipeArrayEmpty {
                recipeListVM.load()
            }
        }
        .alert(isPresented: $isShowAlert) { Alert(title: Text("Error..."), message: Text("No result for your keyword"), dismissButton: .default(Text("OK")))}
    }
    
    func checkRecipeDataEmpty() {
        
        if recipeListVM.recipeArray.count == 0 {
            
            shouldAnimate.toggle()
            recipeListVM.load()
        }
    }
}

//MARK: - PREVIEW

//struct RecipeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        //        let recipes: [Recipe] = [Recipe]()
//        return RecipeListView()
//    }
//}
