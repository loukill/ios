//
//  HomePageView.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var homepageViewModel = HomepageViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var GoToPage2 = false
    
    
    var body: some View {
        NavigationStack{
            
            
            VStack {
                
                
                VStack {
                    VStack {
                        VStack(alignment: .leading, spacing: 0) {
                            ZStack(alignment: .bottomLeading) {
                                HStack {
                                    HStack {
                                        HStack {
                                            Image("img_sort")
                                                .resizable()
                                                .frame(width: getRelativeWidth(18.0),
                                                       height: getRelativeHeight(11.0),
                                                       alignment: .center)
                                                .scaledToFit()
                                                .clipped()
                                            Image("img_group")
                                                .resizable()
                                                .frame(width: getRelativeWidth(40),
                                                       height: getRelativeWidth(50),
                                                       alignment: .center)
                                                .scaledToFit()
                                                .clipped()
                                                .padding(.leading, getRelativeWidth(20.0))
                                            Text(StringConstants.dyslire)
                                                .font(FontScheme
                                                    .kInterSemiBold(size: getRelativeHeight(20.0)))
                                                .fontWeight(.semibold)
                                                .foregroundColor(ColorConstants.Black900)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.center)
                                                .frame(width: getRelativeWidth(103.0),
                                                       height: getRelativeHeight(30.0),
                                                       alignment: .center)
                                                .shadow(color: ColorConstants.Black9003f, radius: 4,
                                                        x: 0, y: 4)
                                                .padding(.leading, getRelativeWidth(01.0))
                                        }
                                        .frame(width: getRelativeWidth(176.0),
                                               height: getRelativeHeight(30.0), alignment: .center)
                                        .padding(.vertical, getRelativeHeight(21.0))
                                        Spacer()
                                        if (!SessionManager.shared.isLogged) {
                                            NavigationLink(destination: SignUpView()) {
                                                Text(StringConstants.kLblSeConnecter2)
                                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(15.0)))
                                                    .fontWeight(.regular)
                                                    .foregroundColor(ColorConstants.Gray900)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(93.0), height: getRelativeHeight(19.0), alignment: .topLeading)
                                            }
                                            .onReceive(NotificationCenter.default.publisher(for: Notification.Name("UserLoggedOut"))) { _ in
                                                // Handle logout event, e.g., navigate to the login view
                                            }
                                        } else {
                                            Button("Log Out") {
                                                SessionManager.shared.logout()
                                            }
                                        }
                                            
                                        
                                                
                                       
                                        
                                        
                                    }.navigationBarBackButtonHidden(true)
                                    .frame(width: getRelativeWidth(340.0),
                                           height: getRelativeHeight(72.0), alignment: .leading)
                                }
                                .frame(width: getRelativeWidth(340.0), height: getRelativeHeight(72.0),
                                       alignment: .leading)
                                .padding(.bottom, getRelativeHeight(185.0))
                             
                                ZStack(alignment: .trailing) {                                    ZStack {
                                        Image("img_pattern")
                                            .resizable()
                                            .frame(width: getRelativeWidth(340.0),
                                                   height: getRelativeHeight(165.0), alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                    }
                                    .hideNavigationBar()
                                    .frame(width: getRelativeWidth(340.0),
                                           height: getRelativeHeight(165.0), alignment: .bottomLeading)
                                    .background(RoundedCorners(topLeft: 40.0, topRight: 40.0,
                                                               bottomLeft: 40.0, bottomRight: 40.0)
                                        .fill(ColorConstants.Indigo300))
                                    .shadow(radius: 19.876922607421875)
                                    .padding(.top, getRelativeHeight(29.82))
                                    Image("img_image_195x135")
                                        .resizable()
                                        .frame(width: getRelativeWidth(140.0),
                                               height: getRelativeHeight(190.0), alignment: .center)
                                        .scaledToFit()
                                    
                                        .padding(.leading, getRelativeWidth(190.82))
                                        .padding(.trailing, getRelativeWidth(14.18))
                                    
                                    
                                    Text(StringConstants.kMsgRServezEtPla)
                                        .font(FontScheme
                                            .kInterMedium(size: getRelativeHeight(40)))
                                        .fontWeight(.medium)
                                        .foregroundColor(ColorConstants.Gray902)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(178.0),
                                               height: getRelativeHeight(84.0), alignment: .topLeading)
                                        .padding(.bottom, getRelativeHeight(10))
                                        .padding(.trailing, getRelativeWidth(143.9))
                                    Button(action: {}, label: {
                                        HStack(spacing: 0) {
                                            Text(StringConstants.kLblConsulter)
                                                .font(FontScheme
                                                    .kInterRegular(size: getRelativeHeight(25)))
                                                .fontWeight(.regular)
                                                .padding(.horizontal, getRelativeWidth(26.0))
                                                .padding(.vertical, getRelativeHeight(11.0))
                                                .foregroundColor(ColorConstants.Indigo300)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.center)
                                                .frame(width: getRelativeWidth(108.0),
                                                       height: getRelativeHeight(37.0),
                                                       alignment: .center)
                                                .background(RoundedCorners(topLeft: 18.885,
                                                                           topRight: 18.885,
                                                                           bottomLeft: 18.885,
                                                                           bottomRight: 18.885)
                                                    .fill(ColorConstants
                                                        .WhiteA700))
                                        }
                                    })
                                    .frame(width: getRelativeWidth(108.0),
                                           height: getRelativeHeight(37.0), alignment: .center)
                                    .background(RoundedCorners(topLeft: 18.885, topRight: 18.885,
                                                               bottomLeft: 18.885,
                                                               bottomRight: 18.885)
                                        .fill(ColorConstants.WhiteA700))
                                    .padding(.top, getRelativeHeight(120.12))
                                    .padding(.trailing, getRelativeWidth(214.11))
                                }
                                .hideNavigationBar()
                                .frame(width: getRelativeWidth(340.0), height: getRelativeHeight(195.0),
                                       alignment: .bottomLeading)
                                
                                
                            }
                            .hideNavigationBar()
                            .frame(width: getRelativeWidth(340.0), height: getRelativeHeight(241.0),
                                   alignment: .center)
                            
                            HStack {
                                VStack {
                                        NavigationLink(destination: ListOfDoctorsView(doctors: [])) {
                                            VStack {
                                                Image("img_mandoctoreuro")
                                                    .frame(width: getRelativeWidth(64.0),
                                                           height: getRelativeWidth(64.0), alignment: .center)
                                                    .background(RoundedCorners(topLeft: 32.4, topRight: 32.4,
                                                                               bottomLeft: 32.4, bottomRight: 32.4)
                                                        .fill(ColorConstants.Gray50))
                                                    .padding(.horizontal, getRelativeWidth(5.0))

                                                Text(StringConstants.kLblMDecins)
                                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(11.926154)))
                                                    .fontWeight(.regular)
                                                    .foregroundColor(ColorConstants.Gray900)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(75.0),
                                                           height: getRelativeHeight(15.0), alignment: .center)
                                                    .padding(.top, getRelativeHeight(13.0))
                                            }
                                            .frame(width: getRelativeWidth(75.0), height: getRelativeHeight(92.0),
                                                   alignment: .center)
                                        }
                                    }
                                Spacer()
                                VStack {
                                    Button(action: {}, label: {
                                        Image("img_brain1")
                                    })
                                    .frame(width: getRelativeWidth(64.0),
                                           height: getRelativeWidth(64.0), alignment: .center)
                                    .background(RoundedCorners(topLeft: 32.4, topRight: 32.4,
                                                               bottomLeft: 32.4, bottomRight: 32.4)
                                        .fill(ColorConstants.Gray50))
                                    .padding(.horizontal, getRelativeWidth(5.0))
                                    Text(StringConstants.kLblProduits)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(11.926154)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Gray900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(75.0),
                                               height: getRelativeHeight(15.0), alignment: .center)
                                        .padding(.top, getRelativeHeight(13.0))
                                }
                                .frame(width: getRelativeWidth(75.0), height: getRelativeHeight(92.0),
                                       alignment: .center)
                                Spacer()
                                VStack {
                                    Button(action: {}, label: {
                                        Image("img_icon")
                                            
                                    })
                                    .frame(width: getRelativeWidth(64.0),
                                           height: getRelativeWidth(64.0), alignment: .center)
                                    .background(RoundedCorners(topLeft: 32.4, topRight: 32.4,
                                                               bottomLeft: 32.4, bottomRight: 32.4)
                                        .fill(ColorConstants.Gray50))
                                    .padding(.horizontal, getRelativeWidth(5.0))
                                    Text(StringConstants.kLblBibliothéques)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(11.926154)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Gray900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(75.0),
                                               height: getRelativeHeight(15.0), alignment: .center)
                                        .padding(.top, getRelativeHeight(13.0))
                                }
                                .frame(width: getRelativeWidth(75.0), height: getRelativeHeight(92.0),
                                       alignment: .center)
                                Spacer()
                                VStack {
                                    Button(action: {}, label: {
                                        Image("img_icon_64x64")
                                        
                                    })
                                    .frame(width: getRelativeWidth(64.0),
                                           height: getRelativeWidth(64.0), alignment: .center)
                                    .background(RoundedCorners(topLeft: 32.4, topRight: 32.4,
                                                               bottomLeft: 32.4, bottomRight: 32.4)
                                        .fill(ColorConstants.Gray50))
                                    Text(StringConstants.kLblActivités)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(15)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Gray900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(56.0),
                                               height: getRelativeHeight(15.0), alignment: .center)
                                        .padding(.top, getRelativeHeight(13.0))
                                        .padding(.horizontal, getRelativeWidth(4.0))
                                }
                                .frame(width: getRelativeWidth(64.0), height: getRelativeHeight(93.0),
                                       alignment: .center)
                                .padding(.trailing, getRelativeWidth(4.0))
                            }
                            .frame(width: getRelativeWidth(340.0), height: getRelativeHeight(94.0),
                                   alignment: .center)
                            .padding(.top, getRelativeHeight(23.0))
                            HStack {
                                Text(StringConstants.kLblSpCialitS)
                                    .font(FontScheme.kInterMedium(size: getRelativeHeight(17.88923)))
                                    .fontWeight(.medium)
                                    .foregroundColor(ColorConstants.Gray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(93.0),
                                           height: getRelativeHeight(22.0), alignment: .topLeading)
                                Spacer()
                                Text(StringConstants.kLblSeeAll)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(11.926154)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.BlueA400)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(39.0),
                                           height: getRelativeHeight(15.0), alignment: .topLeading)
                                    .padding(.vertical, getRelativeHeight(1.0))
                            }
                            .frame(width: getRelativeWidth(340.0), height: getRelativeHeight(22.0),
                                   alignment: .center)
                            .padding(.top, getRelativeHeight(20.0))
                            VStack(spacing: 0) {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyVStack {
                                        Grid {
                                            GridRow {
                                                ForEach(0..<5,id: \.self) { index in
                                                    CategorieCell()
                                                };
                                            }
                                            Divider()
                                            GridRow {
                                                ForEach(0..<5,id: \.self) { index in
                                                    CategorieCell()
                                                };
                                            }
                                        }
                                    }
                                }
                            }
                            .frame(width: getRelativeWidth(311.0), alignment: .leading)
                            .padding(.top, getRelativeHeight(12.0))
                            .padding(.trailing, getRelativeWidth(30.0))
                        }
                        .frame(width: getRelativeWidth(342.0), height: getRelativeHeight(471.0),
                               alignment: .center)
                        .padding(.horizontal, getRelativeWidth(14.0))
                    }
                    .frame(width: getRelativeWidth(372.0), height: getRelativeHeight(471.0),
                           alignment: .leading)
                    VStack(alignment: .leading, spacing: 0) {
                        HStack{
                            Topbarview()
                        }
                    }
                        .frame(width: getRelativeWidth(372.0), height: getRelativeHeight(104.0),
                               alignment: .leading)
                        .padding(.top, getRelativeHeight(150.0))
                }
                .frame(width: getRelativeWidth(372.0), alignment: .topLeading)
                .background(ColorConstants.Gray300Dd)
                .padding(.top, getRelativeHeight(11.0))
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(ColorConstants.Gray300Dd)
            .ignoresSafeArea()
            .hideNavigationBar()
           
        }.navigationBarBackButtonHidden(true)
        
    }
    

}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

