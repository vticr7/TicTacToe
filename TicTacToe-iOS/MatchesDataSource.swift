

import UIKit
import GameKit

typealias LoadedMatchesCompletion = ([GKTurnBasedMatch]?, Error?) -> Void

class MatchesDataSource: NSObject {
    private(set) var matches: [AnyObject] = []
    
    func loadMatches(completion: @escaping LoadedMatchesCompletion) -> Void {
        GKTurnBasedMatch.loadMatches { (matches, error) in
            completion(matches, error)
        }
    }
}
