//
//  Categoriescell.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import SwiftUI

struct CategorieCell: View {
    var body: some View {
        
            HStack {
                Image("img_kidneys1")
                    .resizable()
                    .frame(width: getRelativeWidth(19.0), height: getRelativeHeight(17.0),
                           alignment: .leading)
                    .scaledToFit()
                    .padding(.leading, getRelativeWidth(7.0))
                Text(StringConstants.kLblGeneraliste)
                    .font(FontScheme.kInterRegular(size: getRelativeHeight(10.0)))
                    .fontWeight(.regular)
                    .foregroundColor(ColorConstants.Gray900)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(53.0), height: getRelativeHeight(13.0),
                           alignment: .leading)
                    .padding(.leading, getRelativeWidth(5.0))
                    .padding(.trailing, getRelativeWidth(11.0))
            }
            .frame(width: getRelativeWidth(99.0), height: getRelativeHeight(24.0),
                   alignment: .leading)
            .background(RoundedCorners(topLeft: 10.0, topRight: 10.0, bottomLeft: 10.0,
                                       bottomRight: 10.0)
                    .fill(ColorConstants.Gray50))
           
            .frame(width: getRelativeWidth(94.0), height: getRelativeHeight(24.0),
                   alignment: .leading)
            .background(RoundedCorners(topLeft: 10.0, topRight: 10.0, bottomLeft: 10.0,
                                       bottomRight: 10.0)
                    .fill(ColorConstants.Gray50))
            .padding(.leading, getRelativeWidth(7.0)).frame(width: getRelativeWidth(100.0), alignment: .leading)
            .hideNavigationBar()
    }
}

 struct CategoriesCell_Previews: PreviewProvider {

 static var previews: some View {
             CategorieCell()
 }
 }
