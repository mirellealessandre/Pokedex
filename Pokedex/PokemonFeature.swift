import UIKit

final class PokemonFeature: UIView {
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 15
        return view
    }()
    
     lazy var data: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        addSubviews([title, dataCard])
        dataCard.addSubview(data)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            dataCard.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            dataCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            data.topAnchor.constraint(equalTo: dataCard.topAnchor, constant: 5),
            data.centerXAnchor.constraint(equalTo: dataCard.centerXAnchor),
            data.leadingAnchor.constraint(equalTo: dataCard.leadingAnchor, constant: 10),
            data.bottomAnchor.constraint(equalTo: dataCard.bottomAnchor, constant: -5),
        ])
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

