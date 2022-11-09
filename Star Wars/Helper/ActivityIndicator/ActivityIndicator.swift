//
//  ActivityIndicator.swift
//  StarWars

//
//  Created by Parakrama Ranasinghe on 2022-11-08.
//

import Foundation
import UIKit
import Lottie

class ActivityIndicator {
    
    static let shared = ActivityIndicator()
    var activityIndicator = UIActivityIndicatorView()

    private init() { }
    
    func show(in view: UIView) {
        loadingView.center = view.center
        view.addSubview(loadingView)
        loadingView.play()
    }
    
    private var loadingView: LottieAnimationView = {
        let jsonName = "loaderAnimation"
        let animation = LottieAnimation.named(jsonName)

        // Load animation to AnimationView
        let animationView = LottieAnimationView(animation: animation)
        animationView.frame = CGRect(origin: .zero,
                                     size: CGSize(width: 100, height: 100))
        animationView.loopMode = .loop
        // Play the animation
        return animationView
    }()

    func hide() {
        loadingView.stop()
        loadingView.removeFromSuperview()
    }
}
