//
//  Topbarview.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import SwiftUI

struct Topbarview: View {
    var body: some View {
        TabView{
            HStack(spacing: 50) {
                
                Image("home-2")
                    .resizable()
                    .frame(width: getRelativeWidth(20.0),
                           height: getRelativeHeight(20.0),
                           alignment: .center)
                    .scaledToFit()
                Image("calendar-2")
                    .resizable()
                    .frame(width: getRelativeWidth(20.0),
                           height: getRelativeHeight(20.0),
                           alignment: .center)
                    .scaledToFit()
            
                NavigationLink(destination: SignInView().navigationBarBackButtonHidden(true)){
                    
                    Image("img_messagetext_gray_900")
                        .resizable()
                        .frame(width: getRelativeWidth(20.0),
                               height: getRelativeHeight(20.0),
                               alignment: .center)
                        .scaledToFit()
                }
                NavigationLink(destination: SignUpView()){
                    Image("img_image1460")
                        .resizable()
                        .frame(width: getRelativeWidth(27.0),
                               height: getRelativeWidth(27.0),
                               alignment: .leading)
                        .scaledToFit()
                        .clipped()
                        .padding(.leading, getRelativeWidth(20.0))
                }
                
            }
            
            
           
            
        }.frame( width : UIScreen.main.bounds.width  , height: 100)
    }
}


struct Topbarview_Previews: PreviewProvider {
    static var previews: some View {
        Topbarview()
    }
}
