

import Foundation
import SpriteKit
import GameplayKit

protocol InPlayStateType {
    var scene: SKScene { get }
    var model: TTTModel { get }
    
    init(scene: SKScene)
}

extension InPlayStateType where Self: GKState {
    var model: TTTModel {
        guard let scene = scene as? GameScene else { fatalError() }
        return scene.model
    }
}

class InPlayState: GKState, InPlayStateType {
    fileprivate(set) unowned var scene: SKScene
    
    required init(scene: SKScene) {
        self.scene = scene
        super.init()
    }
}
