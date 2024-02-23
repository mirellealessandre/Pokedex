import UIKit

class PokemonProfileViewController: UIViewController {
    private lazy var pokemonImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "imageTest2"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var pokemonName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()
    
    private lazy var pokemonNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
        
    private lazy var primaryTypeView: TypeView = {
        let type = TypeView()
        type.translatesAutoresizingMaskIntoConstraints = false
        type.backgroundColor = .green
        return type
    }()
    
    private lazy var secondaryTypeView: TypeView = {
        let type = TypeView()
        type.translatesAutoresizingMaskIntoConstraints = false
        return type
    }()
    
    private lazy var typeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubviews([primaryTypeView, secondaryTypeView])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var pokemonDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var pokemonWeight: PokemonFeature = {
        let feature = PokemonFeature()
        feature.translatesAutoresizingMaskIntoConstraints = false
        feature.title.text = "Weight"
        return feature
    }()
    
    private lazy var pokemonHeight: PokemonFeature = {
        let feature = PokemonFeature()
        feature.translatesAutoresizingMaskIntoConstraints = false
        feature.title.text = "Height"
        return feature
    }()
    
    private lazy var firstFeatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubviews([pokemonWeight, pokemonHeight])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var pokemonCategory: PokemonFeature = {
        let feature = PokemonFeature()
        feature.translatesAutoresizingMaskIntoConstraints = false
        feature.title.text = "Category"
        return feature
    }()
    
    private lazy var pokemonAbility: PokemonFeature = {
        let feature = PokemonFeature()
        feature.translatesAutoresizingMaskIntoConstraints = false
        feature.title.text = "Ability"
        return feature
    }()
    
//    private lazy var secondFeatureStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.addArrangedSubviews([pokemonCategory, pokemonAbility])
//        stackView.axis = .horizontal
//        stackView.spacing = 20
//        stackView.distribution = .fillProportionally
//        return stackView
//    }()
    
    private lazy var pokemonAbility2: PokemonFeature = {
        let feature = PokemonFeature()
        feature.translatesAutoresizingMaskIntoConstraints = false
        return feature
    }()
    
    var pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        configurePokemonProfile()
    }
    
    func configurePokemonProfile() {
        pokemonName.text = pokemon.name
        pokemonNumber.text = "N° \(pokemon.id)"
        primaryTypeView.configure(with: pokemon.type[0])

        if pokemon.type.count > 1 {
            secondaryTypeView.isHidden = false
            secondaryTypeView.configure(with: pokemon.type[1])
        }

        pokemonDescription.text = pokemon.description
        pokemonWeight.data.text = pokemon.profile.weight
        pokemonHeight.data.text = pokemon.profile.height
        pokemonCategory.data.text = pokemon.species
        pokemonAbility.data.text = pokemon.profile.abilities[0].name
        pokemonAbility2.data.text = pokemon.profile.abilities[0].name
    }
    
    private func configureUI() {
        view.addSubviews([pokemonImage, pokemonName, pokemonNumber, typeStackView, pokemonDescription, firstFeatureStackView, pokemonCategory, pokemonAbility, pokemonAbility2])
        
        NSLayoutConstraint.activate([
            pokemonImage.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pokemonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 85),

            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 20),
            pokemonName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            pokemonNumber.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 5),
            pokemonNumber.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            typeStackView.topAnchor.constraint(equalTo: pokemonNumber.bottomAnchor, constant: 25),
            typeStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            pokemonDescription.topAnchor.constraint(equalTo: typeStackView.bottomAnchor, constant: 25),
            pokemonDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            pokemonDescription.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            firstFeatureStackView.topAnchor.constraint(equalTo: pokemonDescription.bottomAnchor, constant: 35),
            firstFeatureStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstFeatureStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            pokemonCategory.topAnchor.constraint(equalTo: firstFeatureStackView.bottomAnchor, constant: 100),
            pokemonCategory.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            pokemonAbility.topAnchor.constraint(equalTo: firstFeatureStackView.bottomAnchor, constant: 100),
            pokemonAbility.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonAbility.trailingAnchor.constraint(equalTo: pokemonCategory.trailingAnchor, constant: -20),
            
            pokemonAbility2.topAnchor.constraint(equalTo: pokemonAbility.bottomAnchor, constant: 60),
            pokemonAbility2.centerXAnchor.constraint(equalTo: pokemonAbility.centerXAnchor),
        ])
    }
}
