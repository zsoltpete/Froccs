//
//  ScoreView.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 20..
//  Copyright © 2020. levivig. All rights reserved.
//

import Lottie
import UIKit

class ScoreView: UIView {
    
    // MARK: - Private properties -
    
    private var animationView: AnimationView!
    
    private var current = 1.0
    private var from = 1.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        initAnimationView()
        initGestureRecognizer()
    }
    
    private func initAnimationView() {
        animationView = AnimationView()
        animationView.animation = Animation.named("glass")
        animationView.contentMode = .scaleAspectFit
        
        addSubview(animationView)
        animationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func initGestureRecognizer() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panned(_:)))
        animationView.addGestureRecognizer(pan)
    }
    
    @objc
    private func panned(_  gestureRecognizer: UIPanGestureRecognizer) {
        if case .down = gestureRecognizer.verticalDirection(target: self) {
            log.debug("Swiping down")
            from = current
            current = max(0, current - 0.01)
        } else {
            log.debug("Swiping up")
            from = current
            current = min(1, current + 0.01)
        }
        updateAnimation()
    }
    
    private func updateAnimation() {
        isUserInteractionEnabled = false
        animationView.play(fromProgress: AnimationProgressTime(from), toProgress: AnimationProgressTime(current), loopMode: .none) { [weak self]finished in
            if finished {
                self?.isUserInteractionEnabled = true
            }
        }
    }
    
    func start(_ toProgress: Double) {
        current = toProgress
        animationView.play(toProgress: AnimationProgressTime(toProgress))
    }
    
    func stop() {
        animationView.stop()
    }
    
}

extension UIPanGestureRecognizer {
    
    enum GestureDirection {
        case up
        case down
        case left
        case right
    }
    
    /// Get current vertical direction
    ///
    /// - Parameter target: view target
    /// - Returns: current direction
    func verticalDirection(target: UIView) -> GestureDirection {
        return self.velocity(in: target).y > 0 ? .down : .up
    }
    
    /// Get current horizontal direction
    ///
    /// - Parameter target: view target
    /// - Returns: current direction
    func horizontalDirection(target: UIView) -> GestureDirection {
        return self.velocity(in: target).x > 0 ? .right : .left
    }
    
    /// Get a tuple for current horizontal/vertical direction
    ///
    /// - Parameter target: view target
    /// - Returns: current direction
    func versus(target: UIView) -> (horizontal: GestureDirection, vertical: GestureDirection) {
        return (self.horizontalDirection(target: target), self.verticalDirection(target: target))
    }
    
}
