import SwiftUI


import SwiftUI


struct CategoryView: View {
    @ObservedObject var viewModel: CategoryViewModel
    let category: Category
    let isActive: Bool
    let text: String
    let onCategoryTap: (Category) -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            // Contenu de la vue
            if let imageUrl = category.imageUrl, let url = URL(string: imageUrl) {
                RemoteImageView(url: url)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
            } else {
                Image(systemName: "photo")
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
            }
            
            Text(category.title)
                .font(.custom("PlayfairDisplay-Bold", size: 20))
                .foregroundColor(isActive ? Color.black : Color.gray)
            
            
            
        }
        .onTapGesture {
            self.onCategoryTap(category)
        }
        
    }
   
}

