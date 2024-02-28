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
        return feature
    }()
    
    private lazy var pokemonHeight: PokemonFeature = {
        let feature = PokemonFeature()
        feature.translatesAutoresizingMaskIntoConstraints = false
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
        return feature
    }()
    
    private lazy var pokemonAbility: PokemonFeature = {
        let feature = PokemonFeature()
        feature.translatesAutoresizingMaskIntoConstraints = false
        return feature
    }()
            
    private lazy var pokemonGender: GenderView = {
        let view = GenderView(femalePercentage: 50, malePercentage: 50)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        pokemonDescription.text = pokemon.description
        primaryTypeView.configure(with: pokemon.type[0])

        if pokemon.type.count > 1 {
            secondaryTypeView.isHidden = false
            secondaryTypeView.configure(with: pokemon.type[1])
        }
        pokemonWeight.configureFeatures(title: "Weight", data: pokemon.profile.weight)
        pokemonHeight.configureFeatures(title: "Height", data: pokemon.profile.height)
        pokemonCategory.configureFeatures(title: "Category", data: pokemon.category)

        for ability in pokemon.profile.abilities {
            if ability.hidden == "false" {
                pokemonAbility.configureFeatures(title: "Ability", data: ability.name)
            }
        }
        
        if pokemon.profile.gender == "87.5:12.5" {
            pokemonGender.configureGenderView(pokemonMalePercentage: 87.5, pokemonFemalePercentage: 12.5)
        } else if pokemon.profile.gender == "Genderless" {
            pokemonGender.isHidden = true
        } else {
            pokemonGender.configureGenderView(pokemonMalePercentage: 50, pokemonFemalePercentage: 50)
        }
    }
    
    private func configureUI() {
        view.addSubviews([pokemonImage, pokemonName, pokemonNumber, typeStackView, pokemonDescription, firstFeatureStackView, pokemonCategory, pokemonAbility, pokemonGender])
        
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
            
            pokemonGender.topAnchor.constraint(equalTo: pokemonAbility.bottomAnchor, constant: 100),
            pokemonGender.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonGender.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pokemonGender.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -100),
        ])
    }
}
