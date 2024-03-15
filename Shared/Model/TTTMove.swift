
import GameplayKit

class TTTMove: NSObject, GKGameModelUpdate {
    
    var value: Int = 0
    
    fileprivate(set) var piece: TTTPiece
    fileprivate(set) var index: Int
    
    required init(index: Int, piece: TTTPiece) {
        self.index = index
        self.piece = piece
    }
}

extension TTTMove {
    override var description: String {
        return "index: \(index), value: \(value)"
    }
}
