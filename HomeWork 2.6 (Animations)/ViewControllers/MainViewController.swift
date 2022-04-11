//
//  MainViewController.swift
//  HomeWork 2.6 (Animations)
//
//  Created by Алексей Синяговский on 05.04.2022.
//

import Spring

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var screenView: SpringView!
    @IBOutlet var animationLabel: UILabel! {
        didSet {
            animationLabel.text = animation.description
        }
    }
    
    // MARK: - Private properties
    private var animation = Animation.getAnimation()
    
    
    // MARK: - IBActions
    @IBAction func runButtonPressed(_ sender: UIButton) {
        animationLabel.text = animation.description
        
        screenView.animation = animation.name
        screenView.force = animation.force
        screenView.duration = animation.duration
        screenView.delay = animation.delay
        screenView.curve = animation.curve
        
        screenView.animate()
        
        animation = Animation.getAnimation()
        sender.setTitle("Run \(animation.name)", for: .normal)
    }
}

