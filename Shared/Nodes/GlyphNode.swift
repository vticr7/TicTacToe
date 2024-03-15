

import SpriteKit
import CoreText

class GlyphNode: SKShapeNode {
    let glyph: String
    
    lazy var font: UIFont = {
        return UIFont.systemFont(ofSize: 96.0)
        // For a specific weight, use something like:
        // return UIFont.systemFont(ofSize: 96.0, weight: .regular)
    }()

    
    init(glyph: String) {
        self.glyph = glyph
        
        super.init()

        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var glyphPath: CGPath? = {
        guard self.glyph.count > 0 else { return nil }
        
        var unichars = [UniChar](self.glyph.utf16)
        var glyphs = [CGGlyph](repeating: 0, count: unichars.count)
        let foundGlyphs = CTFontGetGlyphsForCharacters(self.font, &unichars, &glyphs, unichars.count)
        
        guard foundGlyphs else { return nil }
        
        let path = CTFontCreatePathForGlyph(self.font, glyphs[0], nil)!
        return path
    }()
}

extension GlyphNode {
    fileprivate func configure() {
        self.path = glyphPath
        
        guard let path = glyphPath else { return }
        let body = SKPhysicsBody(polygonFrom: path)
        body.affectedByGravity = false
        
        self.physicsBody = body
    }
}
