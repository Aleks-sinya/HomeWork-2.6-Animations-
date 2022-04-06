//
//  MainViewController.swift
//  HomeWork 2.6 (Animations)
//
//  Created by Алексей Синяговский on 05.04.2022.
//

import UIKit
import Spring

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var screenView: SpringView!
    @IBOutlet var runButton: UIButton!
    
    @IBOutlet var nameAnimationLabel: UILabel!
    @IBOutlet var curveAnimationLabel: UILabel!
    @IBOutlet var forceAnimationLabel: UILabel!
    @IBOutlet var durationAnimationLabel: UILabel!
    @IBOutlet var delayAnimationLabel: UILabel!
    
    // MARK: - Private properties
    private var animation = Animation.getAnimation()
    private var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenView.layer.cornerRadius = 12
        runButton.layer.cornerRadius = 12
        
        setTitleToAnimationLabel()
        setTitleToButton()
        setAnimation()
    }
    
    // MARK: - IBActions
    @IBAction func runButtonPressed() {
        index += 1
        setTitleToAnimationLabel()
        setTitleToButton()
        setAnimation()
    }
    
    // MARK: - Private methods
    private func setTitleToAnimationLabel() {
        nameAnimationLabel.text = "preset: \(animation[index].preset)"
        curveAnimationLabel.text = "curve: \(animation[index].curve)"
        forceAnimationLabel.text = "force: \(String(format: "%.2f", animation[index].force))"
        durationAnimationLabel.text = "duration: \(String(format: "%.2f", animation[index].duration))"
        delayAnimationLabel.text = "delay: \(String(format: "%.2f", animation[index].delay))"
    }
    
    private func setAnimation() {
        screenView.animation = animation[index].preset
        screenView.curve = animation[index].curve
        screenView.force = CGFloat(animation[index].force)
        screenView.duration = CGFloat(animation[index].duration)
        screenView.delay = CGFloat(animation[index].delay)
        screenView.animate()
        
    }
    
    private func resetAnimationCount() {
        if animation.count == index + 1 {
            index = 0
        }
    }
    
    private func setTitleToButton() {
        resetAnimationCount()
        runButton.setTitle("Run \(animation[index].preset)", for: .normal)
    }

}

