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
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
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
    
//    private lazy var weightAndHeightStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.addArrangedSubviews([pokemonWeight, pokemonHeight])
//        stackView.axis = .horizontal
//        stackView.spacing = 20
//        stackView.distribution = .fillProportionally
//        return stackView
//    }()
    
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

//    private lazy var categoryAndAbilityStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.addArrangedSubviews([pokemonCategory, pokemonAbility])
//        stackView.axis = .horizontal
//        stackView.spacing = 20
//        stackView.distribution = .fillProportionally
//        return stackView
//    }()
    
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
        view.addSubviews([pokemonImage, pokemonName, pokemonNumber, typeStackView, pokemonDescription,pokemonWeight, pokemonHeight, pokemonCategory, pokemonAbility, pokemonGender])
        
        NSLayoutConstraint.activate([
            pokemonImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pokemonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 85),

            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 20),
            pokemonName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            pokemonName.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            pokemonNumber.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 5),
            pokemonNumber.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            pokemonNumber.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            typeStackView.topAnchor.constraint(equalTo: pokemonNumber.bottomAnchor, constant: 25),
            typeStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            pokemonDescription.topAnchor.constraint(equalTo: typeStackView.bottomAnchor, constant: 25),
            pokemonDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            pokemonDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            pokemonWeight.topAnchor.constraint(equalTo: pokemonDescription.bottomAnchor, constant: 40),
            pokemonWeight.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            pokemonHeight.topAnchor.constraint(equalTo: pokemonDescription.bottomAnchor, constant: 40),
            pokemonHeight.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            pokemonCategory.topAnchor.constraint(equalTo: pokemonWeight.bottomAnchor, constant: 20),
            pokemonCategory.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),

            pokemonAbility.topAnchor.constraint(equalTo: pokemonHeight.bottomAnchor, constant: 20),
            pokemonAbility.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
                        
            pokemonGender.topAnchor.constraint(equalTo: pokemonCategory.bottomAnchor, constant: 100),
            pokemonGender.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonGender.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            pokemonGender.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
        ])
    }
}
