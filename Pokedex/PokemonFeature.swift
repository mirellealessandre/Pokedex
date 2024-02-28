import UIKit

final class PokemonFeature: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
       label.numberOfLines = 0
       label.font = .boldSystemFont(ofSize: 15)
       label.textColor = .black
       return label
   }()
    
    private lazy var dataCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 15
        return view
    }()

    init() {
        super.init(frame: .zero)
        addSubviews([titleLabel, dataLabel, dataCardView])
        dataCardView.addSubview(dataLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                        
            dataCardView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            dataCardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            dataLabel.topAnchor.constraint(equalTo: dataCardView.topAnchor, constant: 5),
            dataLabel.centerXAnchor.constraint(equalTo: dataCardView.centerXAnchor),
            dataLabel.leadingAnchor.constraint(equalTo: dataCardView.leadingAnchor, constant: 10),
            dataLabel.bottomAnchor.constraint(equalTo: dataCardView.bottomAnchor, constant: -5),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureFeatures(title: String, data: String) {
        titleLabel.text = title
        dataLabel.text = data
    }
}

