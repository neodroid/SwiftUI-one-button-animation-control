//
//  ContentView.swift
//  Lottie animation swiftui
//
//  Created by Kevin ahmad on 06/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPaused: Bool = false
    @State var showRoundControl: Bool = false
    @State var offset = CGFloat.zero
    @State var speed: Float = 1
    
    
    
    var body: some View {
        
        let longPress = LongPressGesture(minimumDuration: 0.1)
            .onChanged({ _ in
                withAnimation {
                    showRoundControl = false
                }
            })
            .onEnded { _ in
                withAnimation {
                    showRoundControl = true
                }
                                
            }
        
        
        let drag = DragGesture()
        
            .onChanged({ gesture in
                offset = gesture.translation.width - 100
                print(offset)
                if offset < 0 {
                    speed = 1 + (abs(Float(offset))/75)
                }else {
                    speed = 1 - (abs(Float(offset))/200)
                }
                withAnimation {
                    showRoundControl = true
                }
            })
            .onEnded { _ in
                withAnimation {
                    showRoundControl = false
                }
                offset = CGFloat.zero
            }
        let combined = longPress.sequenced(before: drag)
        
        ZStack {
            Color(red: 167/255, green: 145/255, blue: 157/255)
            VStack {
                Spacer()
                CreditView()
                Spacer()
                LottieView(isPaused: isPaused, speed: speed)
                    .frame(width: 300, height: 300)
                
                Spacer()
                ZStack {
                    
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 75, height: 75, alignment: .center)
                    if showRoundControl {
                        RotatingBarView()
                            .frame(width: 300, height: 20, alignment: .center)
                            .rotationEffect(.degrees((offset / CGFloat(150)) * CGFloat(100)))
                            .transition(.asymmetric(insertion: .scale, removal: .scale))
                        Circle()
                            .fill(.white)
                            .frame(width: 30, height: 30, alignment: .center)
                            .opacity(0.5)
                            .padding(.bottom, 150)
                    }else {
                        Image(systemName: isPaused ?  "play.fill" : "pause.fill")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color(red: 167/255, green: 145/255, blue: 157/255))
                        
                    }
                    
                    
                }
                
                .simultaneousGesture(
                    combined
                        .onEnded({ _ in
                            showRoundControl = false
                            offset = CGFloat.zero
                        })
                )
                
                .highPriorityGesture(TapGesture().onEnded({ _ in
                    print("tap")
                    if showRoundControl {
                        withAnimation {
                            showRoundControl = false
                        }
                    }else {
                        isPaused.toggle()
                    }
                    
                    
                }))
                Spacer()
            }
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
