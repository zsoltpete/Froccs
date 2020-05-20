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
    private var scoreLabel: UILabel!
    
    private var current = 0.0
    private var from = 0.0
    
    private var maxProgress = 0.6
    private var unit = 5.0
    
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
        initScoreLabel()
        initAnimationView()
        initGestureRecognizer()
    }
    
    private func initScoreLabel() {
        scoreLabel = UILabel()
        
        scoreLabel.textAlignment = .center
        
        scoreLabel.textColor = .black
        
        addSubview(scoreLabel)
        scoreLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.centerX.equalToSuperview()
        }
    }
    
    private func initAnimationView() {
        animationView = AnimationView()
        animationView.animation = Animation.named("glass2")
        animationView.contentMode = .scaleAspectFit
        
        addSubview(animationView)
        animationView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(scoreLabel.snp.top).offset(-20.0)
        }
    }
    
    private func initGestureRecognizer() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panned(_:)))
        animationView.addGestureRecognizer(pan)
    }
    
    @objc
    private func panned(_  gestureRecognizer: UIPanGestureRecognizer) {
        var startLocation = CGPoint()
        //UIGestureRecognizerState has been renamed to UIGestureRecognizer.State in Swift 4
        if (gestureRecognizer.state == UIGestureRecognizer.State.began) {
            startLocation = gestureRecognizer.location(in: self.animationView)
        }
        else if (gestureRecognizer.state == UIGestureRecognizer.State.ended) {
            let stopLocation = gestureRecognizer.location(in: self.animationView)
            let dx = stopLocation.x - startLocation.x;
            let dy = stopLocation.y - startLocation.y;
            let distance = sqrt(dx*dx + dy*dy );
            log.debug("Distance: \(distance)");
            
            if case .down = gestureRecognizer.verticalDirection(target: self) {
                log.debug("Swiping down")
                from = current
                current = max(0, current - 1)
            } else {
                log.debug("Swiping up")
                from = current
                current = min(unit, current + 1)
            }
            updateAnimation()
            
            if distance > 400 {
                
            }
        }
        
    }
    
    private func updateAnimation() {
        isUserInteractionEnabled = false
        let percent = String(format: "%d%%", Int(1.0 / unit * current * 100))
        scoreLabel.text = percent
        animationView.play(fromProgress: AnimationProgressTime(maxProgress / unit * from), toProgress: AnimationProgressTime(maxProgress / unit * current), loopMode: .none) { [weak self]finished in
            if finished {
                self?.isUserInteractionEnabled = true
            }
        }
    }
    
    func start(_ toProgress: Double) {
        current = min(1, current)
        current = toProgress
        animationView.play(toProgress: AnimationProgressTime(min(current, maxProgress)))
        let percent = String(format: "%d%%", Int(1.0 / unit * current * 100))
        scoreLabel.text = percent
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
