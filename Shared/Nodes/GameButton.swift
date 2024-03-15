

import SpriteKit

class GameButton: ButtonNode {
    
    lazy var label: SKLabelNode = {
        let node = SKLabelNode(text: self.title)
        
        node.verticalAlignmentMode = .center
        node.fontName = "San Francisco"
        node.zPosition = 5
        node.fontSize = 20
        node.fontColor = Style.Colors.text
        
        return node
    }()
    
    override init(title: String, size: CGSize, action: @escaping ButtonAction) {
        super.init(title: title, size: size, action: action)
        
        addChild(self.label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }
}
