//
//  SignUpView.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var signUpViewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    

    var body: some View {
        NavigationStack{
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Image("img_group")
                            .resizable()
                            .frame(width: getRelativeWidth(60),
                                   height: getRelativeWidth(60), alignment: .center)
                            .scaledToFit()
                            .clipped()
                        Text(StringConstants.dyslire)
                            .font(FontScheme.kInterSemiBold(size: getRelativeHeight(24.0)))
                            .fontWeight(.semibold)
                            .foregroundColor(ColorConstants.Black900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.center)
                            .frame(width: getRelativeWidth(132.0),
                                   height: getRelativeHeight(21.0), alignment: .center)
                            .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0, y: 4)
                            .padding(.bottom, getRelativeHeight(20.0))
                            .padding(.leading, getRelativeWidth(10.0))
                    }
                    .frame(width: getRelativeWidth(181.0), height: getRelativeHeight(41.0),
                           alignment: .leading)
                    
                 
                        HStack {
                            Button( action: {}, label: { Text(StringConstants.kLblSInscrire2)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(15.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Gray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(62.0),
                                           height: getRelativeHeight(19.0), alignment: .center)
                            }
                            ).frame(width: getRelativeWidth(160.0), height: getRelativeHeight(19.0),
                                    alignment: .topLeading)
                            
                            NavigationLink(destination: SignInView()){
                                Text(StringConstants.kLblSeConnecter2)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(15.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Gray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(93.0),
                                           height: getRelativeHeight(19.0), alignment: .topLeading)
                            }
                        }
                        .padding(.top, getRelativeHeight(19.0))
                    HStack {
                        ZStack {}
                            .hideNavigationBar()
                            .frame(width: getRelativeWidth(97.0),
                                   height: getRelativeHeight(2.0), alignment: .center)
                            .background(ColorConstants.Indigo300)
                        Spacer()
                        ZStack {}
                            .hideNavigationBar()
                            .frame(width: getRelativeWidth(97.0),
                                   height: getRelativeHeight(2.0), alignment: .center)
                            .background(ColorConstants.Gray90099)
                            .padding(.leading, getRelativeWidth(75.0))
                    }
                    .frame(width: getRelativeWidth(271.0), height: getRelativeHeight(2.0),
                           alignment: .trailing)
                    .padding(.top, getRelativeHeight(15.0))
                    .padding(.horizontal, getRelativeWidth(16.0))
                    
                    
                    VStack{
                        Text(StringConstants.kMsgNouveauSurHea)
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                            .fontWeight(.regular)
                            .foregroundColor(ColorConstants.Gray900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(300.0), height: getRelativeHeight(40.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(25.0))
                            .padding(.horizontal, getRelativeWidth(10.0))
                        
                        HStack {
                            TextField(StringConstants.Name,
                                      text: $signUpViewModel.name)
                            .font(FontScheme.kInterMedium(size: getRelativeHeight(14.0)))
                            .foregroundColor(ColorConstants.Gray400)
                            .padding()
                            .frame(width: getRelativeWidth(155.0), height: getRelativeHeight(47.0),
                                   alignment: .topLeading)
                            
                            .overlay(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                                    bottomRight: 16.0)
                                .stroke(ColorConstants.Gray200,
                                        lineWidth: 1))
                            .background(RoundedCorners(topLeft: 16.0, topRight: 16.0,
                                                       bottomLeft: 16.0, bottomRight: 16.0)
                                .fill(ColorConstants.WhiteA701))
                            .padding(.top, getRelativeHeight(18.0))
                            .padding(.leading, getRelativeWidth(5.0))
                            .keyboardType(.emailAddress)
                            
                            TextField(StringConstants.LastName,
                                      text: $signUpViewModel.lastName)
                            .font(FontScheme.kInterMedium(size: getRelativeHeight(14.0)))
                            .foregroundColor(ColorConstants.Gray400)
                            .padding()
                            .frame(width: getRelativeWidth(155.0), height: getRelativeHeight(47.0),
                                   alignment: .topLeading)
                            
                            .overlay(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                                    bottomRight: 16.0)
                                .stroke(ColorConstants.Gray200,
                                        lineWidth: 1))
                            .background(RoundedCorners(topLeft: 16.0, topRight: 16.0,
                                                       bottomLeft: 16.0, bottomRight: 16.0)
                                .fill(ColorConstants.WhiteA701))
                            .padding(.top, getRelativeHeight(18.0))
                            .padding(.leading, getRelativeWidth(5.0))
                            .keyboardType(.emailAddress)
                            
                        }.frame(width: getRelativeWidth(100.0), height: getRelativeHeight(47.0))
                            .padding(.bottom, getRelativeHeight(10.0))
                            .padding(.leading, getRelativeWidth(03.0))
                        // .onChange(of: signUpViewModel.formText) { //newValue in
                        
                        //    signUpViewModel.isValidFormText = newValue
                        //       .isValidEmail(isMandatory: true)
                        //}
                        
           
                        // .onChange(of: signUpViewModel.formText) { //newValue in
                        
                        //    signUpViewModel.isValidFormText = newValue
                        //       .isValidEmail(isMandatory: true)
                        //}
                        
                        //    if !signUpViewModel.isValidFormText {
                        //      Text("Please enter valid email.")
                        //       .foregroundColor(Color.red)
                        //     .font(FontScheme.kInterMedium(size: getRelativeHeight(14.0)))
                        //   .frame(width: getRelativeWidth(327.0),
                        //        height: getRelativeHeight(55.0), alignment: .center)
                        // }
                        
                        
                        
                        SecureField(StringConstants.kLblPassword,
                                    text: $signUpViewModel.password)
                        .font(FontScheme.kInterMedium(size: getRelativeHeight(14.0)))
                        .foregroundColor(ColorConstants.Gray400)
                        .padding()
                        .keyboardType(.default)
                        .frame(width: getRelativeWidth(327.0), height: getRelativeHeight(47.0),
                               alignment: .center)
                        .overlay(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                                bottomRight: 16.0)
                            .stroke(ColorConstants.Gray200,
                                    lineWidth: 1))
                        .background(RoundedCorners(topLeft: 16.0, topRight: 16.0,
                                                   bottomLeft: 16.0, bottomRight: 16.0)
                            .fill(ColorConstants.WhiteA701))
                        .padding(.top, getRelativeHeight(10.0))
                        .padding(.leading, getRelativeWidth(5.0))
                        
                        //.onChange(of: signUpViewModel.formoneText) { //newValue in
                        
                        //  signUpViewModel.isValidFormoneText = newValue
                        //.isValidPassword(isMandatory: true)
                        // }
                        
                        // if !signUpViewModel.isValidFormoneText {
                        //   Text("Please enter valid password.")
                        //     .foregroundColor(Color.red)
                        //   .font(FontScheme.kInterMedium(size: getRelativeHeight(14.0)))
                        // .frame(width: getRelativeWidth(327.0),
                        //      height: getRelativeHeight(55.0), alignment: .center)
                        //  }
                        
                        DatePicker( selection: Binding(
                            get: { signUpViewModel.BirthDate ?? Date() },
                            set: { signUpViewModel.BirthDate = $0 }
                        ),
                        in: ...Date.now,
                        displayedComponents: .date) {
                            Text(StringConstants.BirthDay).font(FontScheme.kInterMedium(size: getRelativeHeight(14.0)))
                                .foregroundColor(ColorConstants.Gray400)
                                .padding()
                        }.frame(width: getRelativeWidth(327.0), height: getRelativeHeight(47.0),
                                alignment: .center)
                        .overlay(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                                bottomRight: 16.0)
                            .stroke(ColorConstants.Gray200,
                                    lineWidth: 1))
                        .background(RoundedCorners(topLeft: 16.0, topRight: 16.0,
                                                   bottomLeft: 16.0, bottomRight: 16.0)
                            .fill(ColorConstants.WhiteA701))
                        .padding(.top, getRelativeHeight(10.0))
                        .padding(.leading, getRelativeWidth(5.0))
                        
                        
                        HStack {
                            Image("img_england")
                                .resizable()
                                .frame(width: getRelativeWidth(24.0),
                                       height: getRelativeHeight(17.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                                .background(RoundedCorners(topLeft: 2.0, topRight: 2.0,
                                                           bottomLeft: 2.0, bottomRight: 2.0))
                            
                            
                                .background(RoundedCorners(topLeft: 2.0, topRight: 2.0, bottomLeft: 2.0,
                                                           bottomRight: 2.0))
                                .padding(.vertical, getRelativeHeight(18.0))
                                .padding(.leading, getRelativeWidth(16.0))
                            Divider()
                                .frame(width: getRelativeWidth(1.0),
                                       height: getRelativeHeight(24.0), alignment: .center)
                                .background(ColorConstants.Gray201)
                                .padding(.top, getRelativeHeight(16.0))
                                .padding(.bottom, getRelativeHeight(15.0))
                                .padding(.leading, getRelativeWidth(40.0))
                            
                            TextField(StringConstants.kLblYourNumber,
                                      text: $signUpViewModel.numTel)
                            .font(FontScheme.kInterMedium(size: getRelativeHeight(14.0)))
                            .foregroundColor(ColorConstants.Gray400)
                            .padding()
                            .keyboardType(.emailAddress)
                        }
                        .frame(width: getRelativeWidth(327.0), height: getRelativeHeight(47.0),
                               alignment: .center)
                        .overlay(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                                bottomRight: 16.0)
                            .stroke(ColorConstants.Gray200,
                                    lineWidth: 1))
                        .background(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                                   bottomRight: 16.0)
                            .fill(ColorConstants.WhiteA701))
                        .padding(.top, getRelativeHeight(10.0))
                        .padding(.leading, getRelativeWidth(5.0))
                        NavigationLink(
                            destination: OTPView(signUpViewModel: signUpViewModel),
                            isActive: $signUpViewModel.otpSent
                        ) {
                            Button(action: {
                                signUpViewModel.sendOTP()
                                signUpViewModel.otpSent = true // Set otpSent to true after sending OTP
                            }) {
                                HStack(spacing: 0) {
                                    Text(StringConstants.kLblSInscrire)
                                        .font(FontScheme.kInterMedium(size: getRelativeHeight(16.0)))
                                        .fontWeight(.medium)
                                        .foregroundColor(ColorConstants.WhiteA700)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.center)
                                        .frame(width: getRelativeWidth(327.0), height: getRelativeHeight(47.0), alignment: .center)
                                        .background(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0, bottomRight: 16.0)
                                            .fill(ColorConstants.BlueA400Cc))
                                }
                            }
                        }.frame(width: getRelativeWidth(100.0), height: getRelativeHeight(47.0))
                            .padding(.top, getRelativeHeight(10.0))
                            .padding(.leading, getRelativeWidth(03.0))
                     
                                   
                        
                    }.padding(.top, getRelativeHeight(01.0))
                        .padding(.horizontal, getRelativeWidth(01.0))
                    Group {
                        HStack {
                            Spacer()
                            ZStack {}
                                .hideNavigationBar()
                                .frame(width: getRelativeWidth(118.0),
                                       height: getRelativeHeight(1.0), alignment: .top)
                                .background(ColorConstants.Gray300)
                                .padding(.top, getRelativeHeight(5.0))
                                .padding(.bottom, getRelativeHeight(8.0))
                            Spacer()
                            Text(StringConstants.kLblOrSignInWith)
                                .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                .fontWeight(.regular)
                                .foregroundColor(ColorConstants.Gray500)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(81.0),
                                       height: getRelativeHeight(15.0), alignment: .topLeading)
                            Spacer()
                            ZStack {}
                                .hideNavigationBar()
                                .frame(width: getRelativeWidth(117.0),
                                       height: getRelativeHeight(1.0), alignment: .top)
                                .background(ColorConstants.Gray300)
                                .padding(.top, getRelativeHeight(5.0))
                                .padding(.bottom, getRelativeHeight(8.0))
                            Spacer()
                        }
                        .frame(width: getRelativeWidth(327.0), height: getRelativeHeight(15.0),
                               alignment: .center)
                        .padding(.top, getRelativeHeight(26.0))
                        .padding(.trailing, getRelativeWidth(7.0))
                        HStack {
                            Button(action: {}, label: {
                                Image("img_loginalternati")
                            })
                            .frame(width: getRelativeWidth(46.0), height: getRelativeWidth(46.0),
                                   alignment: .center)
                            .background(RoundedCorners(topLeft: 23.0, topRight: 23.0,
                                                       bottomLeft: 23.0, bottomRight: 23.0)
                                .fill(ColorConstants.Gray100))
                            Button(action: {}, label: {
                                Image("img_loginalternati_blue_a401")
                            })
                            .frame(width: getRelativeWidth(46.0), height: getRelativeWidth(46.0),
                                   alignment: .center)
                            .background(RoundedCorners(topLeft: 23.0, topRight: 23.0,
                                                       bottomLeft: 23.0, bottomRight: 23.0)
                                .fill(ColorConstants.Gray100))
                            .padding(.leading, getRelativeWidth(32.0))
                            Button(action: {}, label: {
                                Image("img_loginalternati_black_900")
                            })
                            .frame(width: getRelativeWidth(46.0), height: getRelativeWidth(46.0),
                                   alignment: .center)
                            .background(RoundedCorners(topLeft: 23.0, topRight: 23.0,
                                                       bottomLeft: 23.0, bottomRight: 23.0)
                                .fill(ColorConstants.Gray100))
                            .padding(.leading, getRelativeWidth(32.0))
                        }
                        .frame(width: getRelativeWidth(202.0), height: getRelativeHeight(10.0),
                               alignment: .center)
                        .padding(.top, getRelativeHeight(32.0))
                        .padding(.horizontal, getRelativeWidth(21.0))
                        Text(StringConstants.kMsgByLoggingYou)
                            .font(FontScheme.kPoppinsRegular(size: getRelativeHeight(11.0)))
                            .fontWeight(.regular)
                            .foregroundColor(ColorConstants.Gray500)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.center)
                            .frame(width: getRelativeWidth(275.0), height: getRelativeHeight(35.0),
                                   alignment: .center)
                            .padding(.top, getRelativeHeight(34.0))
                            .padding(.horizontal, getRelativeWidth(21.0))
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                       alignment: .center)
                
            }
            .hideNavigationBar()
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            .background(ColorConstants.Gray300Dd)
            .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0, y: 4)
            .padding(.top, getRelativeHeight(30.0))
            .padding(.bottom, getRelativeHeight(10.0))
        }
        
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
