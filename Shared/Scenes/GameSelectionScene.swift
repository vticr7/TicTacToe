

import SpriteKit

class GameSelectionScene: SKScene {
    
    let controller = MulitpeerController()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
//        self.backgroundColor = UIColor.red
        
        controller.browser.startBrowsingForPeers()
        controller.advertiser.startAdvertisingPeer()
    }
}
