//
//  ScoreView.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 20..
//  Copyright © 2020. levivig. All rights reserved.
//

import Lottie
import UIKit

protocol ScoreViewDelegate: class {
    func confirmValue(_ value: Int)
}

class ScoreView: UIView {
    
    // MARK: - Public properties -
    
    weak var delegate: ScoreViewDelegate?
    
    // MARK: - Private properties -
    
    private var animationView: AnimationView!
    private var scoreLabel: UILabel!
    private var descLabel: UILabel!
    
    private var currentUnit = 0.0
    private var fromUnit = 0.0
    
    private var maxProgress = 0.6
    private var unit = 5.0
    
    private var percent = 0
    
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
        initDescLabel()
        initAnimationView()
        initScoreLabel()
        
        
        initGestureRecognizer()
    }
    
    private func initDescLabel() {
        descLabel = UILabel()
        
        descLabel.textAlignment = .center
        
        descLabel.textColor = .black
        
        addSubview(descLabel)
//        descLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.leading.centerX.equalToSuperview()
//        }
    }
    
    private func initScoreLabel() {
        scoreLabel = UILabel()
        
        scoreLabel.textAlignment = .center
        
        scoreLabel.textColor = .black
        
        addSubview(scoreLabel)
        //        scoreLabel.snp.makeConstraints { make in
        //            make.bottom.equalToSuperview()
        //            make.leading.centerX.equalToSuperview()
        //        }
    }
    
    private func initAnimationView() {
        animationView = AnimationView()
        animationView.animation = Animation.named("glass2")
        animationView.contentMode = .scaleAspectFit
        
        addSubview(animationView)
        
        //        animationView.snp.makeConstraints { make in
        //            make.leading.trailing.top.equalToSuperview()
        //            make.bottom.equalTo(scoreLabel.snp.top).offset(-20.0)
        //        }
    }
    
    private func initGestureRecognizer() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panned(_:)))
        animationView.addGestureRecognizer(pan)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        doubleTap.numberOfTapsRequired = 2
        animationView.addGestureRecognizer(doubleTap)
    }
    
    @objc
    private func doubleTapped() {
        let backUp = animationView.currentProgress
        delegate?.confirmValue(percent)
        animationView.play(fromProgress: backUp, toProgress: 0.85, loopMode: .playOnce) { [weak self]finished in
            if finished {
                self?.animationView.play(fromProgress: 0.85, toProgress: backUp, loopMode: .playOnce) { finished in
                    if finished {
                        
                    }
                }
            }
        }
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
                fromUnit = currentUnit
                currentUnit = max(0, currentUnit - 1)
            } else {
                log.debug("Swiping up")
                fromUnit = currentUnit
                currentUnit = min(unit, currentUnit + 1)
            }
            updateAnimation()
            
            if distance > 400 {
                
            }
        }
        
    }
    
    private func updateAnimation() {
        isUserInteractionEnabled = false
         percent = Int(1.0 / unit * currentUnit * 100)
        let percentString = String(format: "%d%%", percent)
        scoreLabel.text = percentString
        animationView.play(fromProgress: AnimationProgressTime(maxProgress / unit * fromUnit), toProgress: AnimationProgressTime(maxProgress / unit * currentUnit), loopMode: .none) { [weak self]finished in
            if finished {
                self?.isUserInteractionEnabled = true
            }
        }
    }
    
    func start(_ toProgress: Double) {
        currentUnit = min(1, currentUnit)
        currentUnit = toProgress
        animationView.play(toProgress: AnimationProgressTime(min(currentUnit, maxProgress)))
        let percent = String(format: "%d%%", Int(1.0 / unit * currentUnit * 100))
        scoreLabel.text = percent
    }
    
    func stop() {
        animationView.stop()
    }
    
    func setUserValue(_ value: Int) {
        percent = value
        let percentString = String(format: "%d%%", percent)
        scoreLabel.text = percentString
        currentUnit = Double(percent) / 100.0 * unit
        animationView.play(toProgress: AnimationProgressTime(maxProgress / unit * currentUnit))
    }
    
    func updateDesc(_ desc: String?) {
        descLabel.text = desc
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        descLabel.frame = CGRect(x: 0, y: 0, width: width, height: 40.0)
        animationView.frame = CGRect(x: 0, y: descLabel.height, width: width, height: height - 90.0)
        scoreLabel.frame = CGRect(x: 0, y: animationView.height + descLabel.height + 10.0, width: width, height: 30.0)
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
