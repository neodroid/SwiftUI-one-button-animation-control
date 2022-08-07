//
//  LottieView.swift
//  Lottie animation swiftui
//
//  Created by Kevin ahmad on 06/08/22.
//

import SwiftUI
import Lottie
 
struct LottieView: UIViewRepresentable {
//    let lottieFile: String
    let isPaused: Bool
    let speed: Float
    
 
    let animationView = AnimationView()
 
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
            let view = UIView(frame: .zero)

        Animation.loadedFrom(url: URL(string: "https://assets7.lottiefiles.com/private_files/lf30_tmajwstf.json")!, closure: { animation in
         
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            animationView.animationSpeed = 1
         
        }, animationCache: nil)

            animationView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(animationView)

            NSLayoutConstraint.activate([
                animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
                animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            ])

            return view
        }

        func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
            if isPaused {
                context.coordinator.parent.animationView.pause()
            } else {
                context.coordinator.parent.animationView.play()
            }
            context.coordinator.parent.animationView.animationSpeed = CGFloat(speed)
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        class Coordinator: NSObject {
            var parent: LottieView

            init(_ parent: LottieView) {
                self.parent = parent
            }
        }
    }




