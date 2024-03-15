
import GameplayKit

@objc class TTTPlayer: NSObject, GKGameModelPlayer {
    
    fileprivate(set) var playerId: Int
    fileprivate(set) var piece: TTTPiece
    
    init(playerId: Int, piece: TTTPiece) {
        self.playerId = playerId
        self.piece = piece
        super.init()
    }
}
