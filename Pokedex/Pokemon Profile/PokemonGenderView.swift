import UIKit

final class GenderView: UIView {
    private lazy var genderTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        label.text = "GÊNERO"
        return label
    }()
        
    private lazy var maleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var femaleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink
        return view
    }()
    
    private lazy var malePercentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        return label
    }()

    private lazy var femalePercentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        return label
    }()
    
    var femalePercentage: Double
    var malePercentage: Double

    init(femalePercentage: Double, malePercentage: Double) {
        self.femalePercentage = femalePercentage
        self.malePercentage = malePercentage
        super.init(frame: .zero)
        addSubviews([genderTitleLabel, maleView, femaleView, malePercentageLabel, femalePercentageLabel])
        
        NSLayoutConstraint.activate([
            genderTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            genderTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            maleView.topAnchor.constraint(equalTo: genderTitleLabel.bottomAnchor, constant: 15),
            maleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            maleView.heightAnchor.constraint(equalToConstant: 10),

            femaleView.topAnchor.constraint(equalTo: genderTitleLabel.bottomAnchor, constant: 15),
            femaleView.leadingAnchor.constraint(equalTo: maleView.trailingAnchor),
            femaleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            femaleView.heightAnchor.constraint(equalToConstant: 10),

            malePercentageLabel.topAnchor.constraint(equalTo: femaleView.bottomAnchor, constant: 5),
            malePercentageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),

            femalePercentageLabel.topAnchor.constraint(equalTo: femaleView.bottomAnchor, constant: 5),
            femalePercentageLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            femalePercentageLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureGenderView(pokemonMalePercentage: Double, pokemonFemalePercentage: Double) {
        malePercentageLabel.text = String(pokemonMalePercentage)
        malePercentage = pokemonMalePercentage
        femalePercentageLabel.text = String(pokemonFemalePercentage)
        femalePercentage = pokemonFemalePercentage
        
        NSLayoutConstraint.activate([
            maleView.widthAnchor.constraint(equalTo: femaleView.widthAnchor, multiplier: CGFloat(malePercentage/femalePercentage))
        ])
    }
}

