import Foundation

struct Pokemon {
    let id: Int
    let name: String
    let type: [Pokemon.Element]
    let category: String
    let description: String
    let image: Image
    let profile: Profile
    let base: Base?


    init(from dict: [String: Any]) {
        self.id = dict["id"] as! Int
        self.name = (dict["name"] as! [String: String])["english"]!
        self.type = (dict["type"] as! [String]).compactMap { Pokemon.Element(rawValue: $0) }
        self.category = dict["species"] as! String
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
    let abilities: [Ability]
    let gender: String
    
    init(from dict: [String: Any]) {
        self.height = dict["height"] as! String
        self.weight = dict["weight"] as! String
        self.egg = dict["egg"] as? [String]
        self.abilities = (dict["ability"] as! [[String]]).map { Ability(from: $0) }
        self.gender = dict["gender"] as! String
    }
}

struct Ability {
    let name: String
    let hidden: String
    
    init(from dict: [String]) {
        self.name = dict[0]
        self.hidden = dict[1]
    }
}

struct Gender {
    let femalePercentage: Double
    let malePercentage: Double
    
    init(femalePercentage: Double, malePercentage: Double) {
        self.femalePercentage = femalePercentage
        self.malePercentage = malePercentage
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
