
import SpriteKit

import SpriteKit

class MenuButton: ButtonNode {
    
    lazy var label: SKLabelNode = {
        let node = SKLabelNode(text: self.title)
        
        node.verticalAlignmentMode = .center
        // Use system font name
        node.fontName = UIFont.systemFont(ofSize: UIFont.systemFontSize).fontName
        node.zPosition = 5
        node.fontColor = Style.Colors.text
        
        return node
    }()
    
    // Add a property for the background shape
    var backgroundShape: SKShapeNode?
    
    override init(title: String, size: CGSize, action: @escaping ButtonAction) {
        super.init(title: title, size: size, action: action)
        
        // Create a rounded rectangle shape
        let cornerRadius: CGFloat = 10
        let roundedRect = SKShapeNode(rectOf: size, cornerRadius: cornerRadius)
        roundedRect.fillColor = SKColor.white // Set to the desired background color
        roundedRect.strokeColor = SKColor.clear // Adjust as needed
        roundedRect.zPosition = 1 // Ensure it's behind the label
        
        // Add the shape as a child of the button, making it the background
        addChild(roundedRect)
        self.backgroundShape = roundedRect
        
        // Make sure the label is added after to keep it on top
        addChild(self.label)
        
        // Adjust the label font name as needed to use the system font properly
        // "San Francisco" is not directly usable, use system font methods instead
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }
    
    // If you need to update the button's size dynamically, ensure to also update the backgroundShape's path
    func updateButtonSize(to newSize: CGSize) {
        let newPath = CGPath(roundedRect: CGRect(origin: CGPoint(x: -newSize.width / 2, y: -newSize.height / 2), size: newSize), cornerWidth: 10, cornerHeight: 10, transform: nil)
        backgroundShape?.path = newPath
    }
}

