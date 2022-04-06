//
//  Animation.swift
//  HomeWork 2.6 (Animations)
//
//  Created by Алексей Синяговский on 05.04.2022.
//

struct Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    static func getAnimation() -> [Animation] {
        var animations: [Animation] = []
        
        let presets = DataManager.shared.namesAnimation.shuffled()
        let curves = DataManager.shared.curvesAnimation.shuffled()
        let force = DataManager.shared.force
        let duration = DataManager.shared.duration
        let delay = DataManager.shared.delay
        
        for index in 0..<presets.count {
            let animation = Animation(
                preset: presets[index],
                curve: curves[index],
                force: force,
                duration: duration,
                delay: delay
            )
            animations.append(animation)
        }
        return animations
    }
}
