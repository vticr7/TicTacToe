
import UIKit

class RoundCellView: UIView {
    
    var selected: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var highlighted: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        Style.Colors.button.setFill()
        
        let height = rect.height
//        let radius = (height.truncatingRemainder(dividingBy: 2) == 0) ? height : height - 1
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
        path.addClip()
        path.fill()
    }

}
