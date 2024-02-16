import UIKit

final class BackgroundView: UIView {
    private lazy var imageCard: UIView = {
        let image = UIView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 15
        return image
    }()

    private lazy var imageOutline: UIImageView = {
        let outline = UIImageView(image: UIImage())
        outline.translatesAutoresizingMaskIntoConstraints = false
        outline.contentMode = .scaleAspectFit
        return outline
    }()
        
    init() {
        super.init(frame: .zero)
        addSubviews([imageCard])
        imageCard.addSubview(imageOutline)
        
        NSLayoutConstraint.activate([
            imageCard.topAnchor.constraint(equalTo: topAnchor),
            imageCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageCard.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageOutline.centerXAnchor.constraint(equalTo: imageCard.centerXAnchor),
            imageOutline.centerYAnchor.constraint(equalTo: imageCard.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
            
    func configureBackground(with type: Pokemon.Element) {
        imageCard.backgroundColor = type.backgroundColor
        imageOutline.image = type.outlineImage
    }
}

extension Pokemon.Element {
    var outlineImage: UIImage? {
        UIImage(named: "\(rawValue.lowercased())Outline")
    }
}

