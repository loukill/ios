//
//  HomeScreen.swift
//  Furniture_app
//

import SwiftUI


struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var textItems: [TextItem] = [
            TextItem(title: "Text 1", detailedText: "Detailed text for Text 1"),
            TextItem(title: "Text 2", detailedText: "Detailed text for Text 2")
        ]

        private var products: [Product] {
            [
                Product(imageName: "cours", title: "Cours", destinationView: AnyView(TextItemsListView(textItems: textItems))),
                Product(imageName: "exercice", title: "Exercice", destinationView: AnyView(GameView()))
            ]
        }
    


    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        AppBarView(
                            menuAction: {
                            print("Menu button tapped")},
                            profileAction: {
                            print("Profile button tapped")})
                    
                        Spacer()
                            .frame(height: 20)
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView(search: $search)
                        Spacer()
                            .frame(height: 20)
                        
                        Text("Categories")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(products, id: \.imageName) { product in
                                    if let destination = product.destinationView {
                                        NavigationLink(destination: destination, label: {
                                            ProductCardView(image: Image(product.imageName), size: 130, title: product.title)
                                                .foregroundColor(Color.black)
                                        })
                                    } else {
                                        ProductCardView(image: Image(product.imageName), size: 130, title: product.title)
                                    }
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Bibliothèque")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(products, id: \.imageName) { product in
                                    ProductCardView(image: Image(product.imageName), size: 130, title: product.title)
                                    
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Produits")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(products, id: \.imageName) { product in
                                    ProductCardView(image: Image(product.imageName), size: 130, title: product.title)
                                    
                                }
                                .padding(.leading)
                            }
                        }
                        
                    }
                }
                
                VStack {
                    Spacer()
                }
            }
        }
    }
    
    
    
    
    struct HomeScreen_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreen()
        }
    }
    
    
    
    struct AppBarView: View {
        var menuAction: () -> Void
        var profileAction: () -> Void
        var body: some View {
            HStack {
                Button(action: menuAction) {
                    Image("menu")
                        .padding()
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .cornerRadius(10.0)
                }
                
                Spacer()
                
                Button(action: profileAction) {
                    Image(uiImage: #imageLiteral(resourceName: "Profile"))
                        .resizable()
                        .frame(width: 42, height: 42)
                        .cornerRadius(10.0)
                }
            }
            .padding(.horizontal)
        }
        
    }
    
    struct TagLineView: View {
        var body: some View {
            Text("Choisir ton préféré")
                .font(.custom("PlayfairDisplay-Bold", size: 28))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
        }
    }
    
    struct SearchAndScanView: View {
        @Binding var search: String
        var body: some View {
            HStack {
                HStack {
                    Image("Search")
                        .padding(.trailing, 8)
                    TextField("Search", text: $search)
                }
                .padding(.all, 20)
                .background(Color.white)
                .foregroundColor(Color.black)
                .cornerRadius(10.0)
                .padding(.trailing, 8)
                
            }
            .padding(.horizontal)
        }
    }
    
    struct CategoryView: View {
        let isActive: Bool
        let text: String
        var body: some View {
            VStack (alignment: .leading, spacing: 0) {
                Text(text)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(isActive ? Color.black: Color.black.opacity(0.5))
                if (isActive) { Color.black
                        .frame(width: 15, height: 2)
                        .clipShape(Capsule())
                }
            }
            .padding(.trailing)
        }
    }
    
    struct ProductCardView: View {
        let image: Image
        let size: CGFloat
        let title: String
        
        var body: some View {
            VStack {
                image
                    .resizable()
                    .frame(width: size, height: 200 * (size/210))
                    .cornerRadius(20.0)
                Text(title).font(.title3).fontWeight(.bold)
                
            }
            .frame(width: size)
            .padding()
            .background(Color.white)
            .cornerRadius(20.0)
            
        }
    }
    
}

