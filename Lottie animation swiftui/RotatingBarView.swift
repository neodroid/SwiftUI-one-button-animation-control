//
//  RotatingBarView.swift
//  Lottie animation swiftui
//
//  Created by Kevin ahmad on 07/08/22.
//

import SwiftUI

struct RotatingBarView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 0.25))
            VStack {
                Image(systemName: "play")
                    .foregroundColor(.white)
                Spacer()
                HStack{
                    Image(systemName: "backward.fill")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "forward.fill")
                        .foregroundColor(.white)
                }
                Spacer()
                Image(systemName: "play.fill")
                    .hidden()
            }.padding()
        }.frame(width: 200, height: 200)
//            .background(.red)
    }
}

struct RotatingBarView_Previews: PreviewProvider {
    static var previews: some View {
        RotatingBarView()
    }
}
