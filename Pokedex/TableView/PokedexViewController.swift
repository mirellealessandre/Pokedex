import UIKit

final class PokedexViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 150
        return tableView
    }()
    
    var dataSource = [Pokemon]()
    let json = "https://raw.githubusercontent.com/Purukitto/pokemon-data.json/master/pokedex.json"

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "Lista Pokédex"
        
        PokemonService().requestList(from: json) { pokemon in
            self.dataSource = pokemon
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func configureTableView() {
        view.addSubviews([tableView])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "PokemonCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PokedexViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonTableViewCell
        let pokemon = dataSource[indexPath.row]
        cell.configure(with: pokemon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = dataSource[indexPath.row]
        let pokemonProfileViewController = PokemonProfileViewController(pokemon: pokemon)
        navigationController?.pushViewController(pokemonProfileViewController, animated: true)
    }
}
