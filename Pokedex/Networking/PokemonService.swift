import Foundation

final class PokemonService {
    
    func requestList(from url: String, completion: @escaping (([Pokemon]) -> Void)) {
        guard let url = URL(string: url) else {
            return
        }

        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let array = (try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String: Any]]) ?? []
            
            let pokemon = array.map { Pokemon(from: $0) }
            
            completion(pokemon)
        }
        task.resume()
    }

    
}
