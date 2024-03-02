import UIKit

class PokemonTableViewCell: UITableViewCell {
    private lazy var pokemonImage: CustomImageViewCell = {
        let image = CustomImageViewCell()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
        
    private lazy var pokemonImageOutline: BackgroundView = {
        let background = BackgroundView()
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    private lazy var pokemonName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var pokemonNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()

    private lazy var primaryTypeView: TypeView = {
        let type = TypeView()
        type.translatesAutoresizingMaskIntoConstraints = false
        return type
    }()
    
    private lazy var secondaryTypeView: TypeView = {
        let type = TypeView()
        type.translatesAutoresizingMaskIntoConstraints = false
        type.isHidden = true
        return type
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews([pokemonImageOutline, pokemonImage, pokemonName, pokemonNumber, primaryTypeView, secondaryTypeView])
        configureCell()
    }
    
    private func configureCell() {
        NSLayoutConstraint.activate([
            pokemonImageOutline.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            pokemonImageOutline.leadingAnchor.constraint(greaterThanOrEqualTo: pokemonName.trailingAnchor, constant: 15),
            pokemonImageOutline.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            pokemonImageOutline.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            pokemonImage.topAnchor.constraint(equalTo: pokemonImageOutline.topAnchor, constant: 5),
            pokemonImage.centerXAnchor.constraint(equalTo: pokemonImageOutline.centerXAnchor),
            pokemonImage.leadingAnchor.constraint(equalTo: pokemonImageOutline.leadingAnchor, constant: 20),
            pokemonImage.bottomAnchor.constraint(equalTo: pokemonImageOutline.bottomAnchor, constant: 5),
                        
            pokemonNumber.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            pokemonNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pokemonNumber.trailingAnchor.constraint(lessThanOrEqualTo: pokemonImage.trailingAnchor, constant: -20),
            
            pokemonName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pokemonName.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            primaryTypeView.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 10),
            primaryTypeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            primaryTypeView.trailingAnchor.constraint(lessThanOrEqualTo: pokemonImage.trailingAnchor, constant: 16),
            primaryTypeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            secondaryTypeView.centerYAnchor.constraint(equalTo: primaryTypeView.centerYAnchor),
            secondaryTypeView.leadingAnchor.constraint(equalTo: primaryTypeView.trailingAnchor, constant: 5),
            secondaryTypeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        secondaryTypeView.isHidden = true
    }

    func configure(with pokemon: Pokemon) {
        pokemonNumber.text = "N° \(pokemon.id)"
        pokemonName.text = pokemon.name
        primaryTypeView.configure(with: pokemon.type[0])
        
        if pokemon.type.count > 1 {
            secondaryTypeView.isHidden = false
            secondaryTypeView.configure(with: pokemon.type[1])
        }
        
        pokemonImageOutline.configureBackground(with: pokemon.type[0])
        backgroundColor = pokemon.type[0].backgroundColorView
        
        if let url = URL(string: pokemon.image.thumbnail) {
            pokemonImage.loadImageView(from: url)
        }
    }
    
    
}

extension Pokemon.Element {
    var backgroundColorView: UIColor? {
        UIColor(named: rawValue.lowercased())?.withAlphaComponent(0.5)
    }
}

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach(addSubview(_:))
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach(addArrangedSubview(_:))
    }
}
