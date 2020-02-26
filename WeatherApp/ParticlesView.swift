//
//  ParticlesView.swift
//  WeatherApp
//
//  Created by Artur Anissimov on 26.02.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit
import SpriteKit

class ParticlesView: SKView {

    override func didMoveToSuperview() {
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        
        if let particles = SKEmitterNode(fileNamed: "ParticalScene.sks") {
            particles.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            particles.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            //scene.addChild(particles)
        }
        
        
        
    }
}
