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
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var pokemonCategory: PokemonFeature = {
        let feature = PokemonFeature()
        feature.translatesAutoresizingMaskIntoConstraints = false
        feature.title.text = "Category"
        feature.data.text = "Seed"
        return feature
    }()
    
    private lazy var pokemonHability: PokemonFeature = {
        let feature = PokemonFeature()
        feature.translatesAutoresizingMaskIntoConstraints = false
        feature.title.text = "Hability"
        feature.data.text = "Overgrow"
        return feature
    }()

    private lazy var secondFeatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubviews([pokemonCategory, pokemonHability])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var pokemonWeaknessTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.text = "Fraquezas"
        return label
    }()
    
    private lazy var pokemonWeaknessCard: PokemonWeaknessView = {
        let view = PokemonWeaknessView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.firstView.text = "Fogo"
        view.firstView.backgroundColor = .orange
        view.secondView.text = "Psíquico"
        view.secondView.backgroundColor = .systemPink
        view.thirdView.text = "Voador"
        view.thirdView.backgroundColor = .blue
        view.fourthView.text = "Gelo"
        view.fourthView.backgroundColor = .cyan
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
        primaryTypeView.configure(with: pokemon.type[0])

        if pokemon.type.count > 1 {
            secondaryTypeView.isHidden = false
            secondaryTypeView.configure(with: pokemon.type[1])
        }

        pokemonDescription.text = pokemon.description
        pokemonWeight.data.text = pokemon.profile.weight
        pokemonHeight.data.text = pokemon.profile.height

    }
    
    private func configureUI() {
        view.addSubviews([pokemonImage, pokemonName, pokemonNumber, typeStackView, pokemonDescription, firstFeatureStackView, secondFeatureStackView, pokemonWeaknessTitle, pokemonWeaknessCard])
        
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
            
            secondFeatureStackView.topAnchor.constraint(equalTo: firstFeatureStackView.bottomAnchor, constant: 100),
            secondFeatureStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondFeatureStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            pokemonWeaknessTitle.topAnchor.constraint(equalTo: secondFeatureStackView.bottomAnchor, constant: 100),
            pokemonWeaknessTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),

            pokemonWeaknessCard.topAnchor.constraint(equalTo: pokemonWeaknessTitle.bottomAnchor, constant: 15),
            pokemonWeaknessCard.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
        ])
    }
}

final class PokemonWeaknessView: UIView {
    lazy var firstView: TypeView2 = {
        let view = TypeView2()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var secondView: TypeView2 = {
        let view = TypeView2()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var primaryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubviews([firstView, secondView])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var thirdView: TypeView2 = {
        let view = TypeView2()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var fourthView: TypeView2 = {
        let view = TypeView2()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var secondaryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubviews([thirdView, fourthView])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        addSubviews([firstView, secondView, thirdView, fourthView])
        
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            firstView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            secondView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: 10),
            secondView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            thirdView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 10),
            thirdView.leadingAnchor.constraint(equalTo: leadingAnchor),
            thirdView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            fourthView.topAnchor.constraint(equalTo: secondView.bottomAnchor, constant: 10),
            fourthView.leadingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: 10),
            fourthView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            fourthView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

