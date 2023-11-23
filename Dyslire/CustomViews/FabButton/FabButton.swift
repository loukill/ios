//
//  FabButton.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import SwiftUI

struct FabButton: View {
    let action: () -> Void
    var backgroundColor: Color = .blue
    var image: String
    var frameInfo: (Double, Double) = (50.0, 50.0) // 0 for width & 1 for height

    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Image(image)
                .resizable()
                .colorMultiply(.white)
                .padding()
                .frame(width: CGFloat(frameInfo.0), height: CGFloat(frameInfo.1),
                       alignment: .center)
                .clipShape(Circle())
        })
        .padding()
        .background(backgroundColor)
        .frame(width: CGFloat(frameInfo.0), height: CGFloat(frameInfo.1), alignment: .center)
        .clipShape(Circle())
    }
}

struct FabButton_Previews: PreviewProvider {
    static var previews: some View {
        FabButton(action: {}, backgroundColor: Color.blue, image: "", frameInfo: (50.0, 50.0))
    }
}
