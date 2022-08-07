//
//  CreditView.swift
//  Lottie animation swiftui
//
//  Created by Kevin ahmad on 07/08/22.
//


import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack{
            HStack(spacing: 0) {
                Text("github/")
                    .padding(.top,20)
                    .font(.system(size: 24, weight: .light, design: .rounded))
                    .foregroundColor(Color.white)
                Text("neodroid")
                    .padding(.top,20)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(Color.white)
            }
            HStack(spacing: 0) {
                Text("twitter/")
                    .padding(.top,5)
                    .font(.system(size: 24, weight: .light, design: .rounded))
                .foregroundColor(Color.white)
                Text("kevinahmad")
                    .padding(.top,5)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}

