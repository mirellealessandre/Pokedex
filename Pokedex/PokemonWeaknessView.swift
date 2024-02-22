import UIKit

final class PokemonWeaknessView: UIView {
    private lazy var firstView: TypeView = {
        let view = TypeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondView: TypeView = {
        let view = TypeView()
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
    
    private lazy var thirdView: TypeView = {
        let view = TypeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var fourthView: TypeView = {
        let view = TypeView()
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
    
    func configureView(with )
}
