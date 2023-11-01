struct Constants
{
    enum GameGenre {
        case action
        case adventure
        case rolePlaying
        case simulation
        case strategy
        case sports
        case puzzle
        case fighting
        case horror
        case sandbox
        case openWorld
        case racing
        case platformer
        case multiplayerOnlineBattleArena
        case massivelyMultiplayerOnline
        
        var description: String {
            switch self {
            case .action:
                return "Action"
            case .adventure:
                return "Adventure"
            case .rolePlaying:
                return "Role Playing"
            case .simulation:
                return "Simulation"
            case .strategy:
                return "Strategy"
            case .sports:
                return "Sports"
            case .puzzle:
                return "Puzzle"
            case .fighting:
                return "Fighting"
            case .horror:
                return "Horror"
            case .sandbox:
                return "Sandbox"
            case .openWorld:
                return "Open World"
            case .racing:
                return "Racing"
            case .platformer:
                return "Platformer"
            case .multiplayerOnlineBattleArena:
                return "MOBA (Multiplayer Online Battle Arena)"
            case .massivelyMultiplayerOnline:
                return "MMO (Massively Multiplayer Online)"
            }
        }
    }
    
}
