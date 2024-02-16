import Foundation

struct Pokemon {
    let id: Int
    let name: String
    let type: [Pokemon.Element]
    let species: String
    let description: String
    let image: Image
    let profile: Profile
    let base: Base?


    init(from dict: [String: Any]) {
        self.id = dict["id"] as! Int
        self.name = (dict["name"] as! [String: String])["english"]!
        self.type = (dict["type"] as! [String]).compactMap { Pokemon.Element(rawValue: $0) }
        self.species = dict["species"] as! String
        self.description = dict["description"] as! String
        self.image = Image(from: dict["image"] as! [String: String])
        self.profile = Profile(from: dict["profile"] as! [String: Any])
        
        if let base = dict["base"] as? [String: Int] {
            self.base = Base(from: base)
        } else {
            self.base = nil
        }
    }
}

struct Base {
    let hp: Int
    let attack: Int
    let defense: Int
    let spAttack:Int
    let spDefense: Int
    let speed: Int
    
    init(from dict: [String: Int]) {
        self.hp = dict["HP"]!
        self.attack = dict["Attack"]!
        self.defense = dict["Defense"]!
        self.spAttack = dict["Sp. Attack"]!
        self.spDefense = dict["Sp. Defense"]!
        self.speed = dict["Speed"]!
    }
}

struct Image {
    let sprite: String
    let thumbnail: String
    let hires: String?
    
    init(from dict: [String: String]) {
        self.sprite = dict["sprite"]!
        self.thumbnail = dict["thumbnail"]!
        self.hires = dict["hires"]
    }
}

struct Profile {
    let height: String
    let weight: String
    let egg: [String]?
    let ability: [[String]]
    let gender: String
    
    init(from dict: [String: Any]) {
        self.height = dict["height"] as! String
        self.weight = dict["weight"] as! String
        self.egg = dict["egg"] as? [String]
        self.ability = dict["ability"] as! [[String]]
        self.gender = dict["gender"] as! String
    }
}

extension Pokemon {
    enum Element: String {
        case bug = "Bug"
        case dark = "Dark"
        case dragon = "Dragon"
        case electric = "Electric"
        case fairy = "Fairy"
        case fighting = "Fighting"
        case fire = "Fire"
        case flying = "Flying"
        case ghost = "Ghost"
        case grass = "Grass"
        case ground = "Ground"
        case ice = "Ice"
        case normal = "Normal"
        case poison = "Poison"
        case psychic = "Psychic"
        case rock = "Rock"
        case steel = "Steel"
        case water = "Water"
    }
}
