//
//  OTPView.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import SwiftUI

struct OTPView: View {
    @StateObject var signUpViewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
           
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text(StringConstants.kMsgOtpVerificatio)
                        .font(FontScheme.kInterBold(size: getRelativeHeight(70.0)))
                        .fontWeight(.bold)
                        .foregroundColor(ColorConstants.BlueA400Cc)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(255.0), height: getRelativeHeight(39.0),
                               alignment: .topLeading)
                        .padding(.trailing)
                    Text(StringConstants.kMsgVerifiezLeCod)
                        .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.Gray600)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(38.0),
                               alignment: .topLeading)
                        .padding(.top, getRelativeHeight(30.0))
                        .padding(.trailing, getRelativeWidth(10.0))
                }
                .frame(width: getRelativeWidth(327.0), height: getRelativeHeight(91.0),
                       alignment: .center)
                .padding(.top, getRelativeHeight(54.0))
                .padding(.horizontal, getRelativeWidth(23.0))
                VStack {
                    HStack(spacing: getRelativeWidth(8.0)) {
                                            ForEach(0..<6, id: \.self) { index in
                                                TextField("", text: $signUpViewModel.otp[index])
                                                    .frame(width: getRelativeWidth(50.0), height: getRelativeHeight(80.0))
                                                    .font(.title)
                                                    .keyboardType(.numberPad)
                                                    .multilineTextAlignment(.center)
                                                    .background(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                                                               bottomRight: 16.0)
                                                        .fill(ColorConstants.WhiteA701))
                                            }
                                        }
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                        .padding(.vertical, getRelativeHeight(30.0))
                                        .foregroundColor(ColorConstants.Gray400)
                        
                        Button(action: {signUpViewModel.RegistrationSubmit()}, label: {
                            HStack(spacing: 0) {
                                Text(StringConstants.kLblVRifier)
                                    .font(FontScheme.kInterMedium(size: getRelativeHeight(16.0)))
                                    .fontWeight(.medium)
                                
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .frame(width: getRelativeWidth(327.0),
                                           height: getRelativeHeight(47.0), alignment: .center)
                                    .background(RoundedCorners(topLeft: 16.0, topRight: 16.0,
                                                               bottomLeft: 16.0, bottomRight: 16.0)
                                        .fill(ColorConstants.BlueA400Cc))
                                
                            }
                        })
                        
                        
                        .frame(width: getRelativeWidth(327.0), height: getRelativeHeight(52.0),
                               alignment: .center)
                        .overlay(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                                bottomRight: 16.0)
                            .stroke(ColorConstants.BlueA400Cc,
                                    lineWidth: 1))
                        .background(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                                   bottomRight: 16.0)
                            .fill(ColorConstants.BlueA400Cc))
                        .padding(.top, getRelativeHeight(200.0))
                    }
                    .frame(width: getRelativeWidth(327.0), height: getRelativeHeight(503.0),
                           alignment: .center)
                    .padding(.vertical, getRelativeHeight(62.0))
                    .padding(.horizontal, getRelativeWidth(23.0))
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.Gray300Dd)
                .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0, y: 4)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(ColorConstants.Gray300Dd)
            .ignoresSafeArea()
            .hideNavigationBar()
        }
    }
    
    struct OTPView_Previews: PreviewProvider {
        static var previews: some View {
            OTPView()
        }
    }
    

