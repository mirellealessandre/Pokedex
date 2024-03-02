import UIKit

final class BackgroundView: UIView {
    private lazy var imageOutline: UIImageView = {
        let outline = UIImageView(image: UIImage())
        outline.translatesAutoresizingMaskIntoConstraints = false
        outline.contentMode = .scaleAspectFit
        return outline
    }()
        
    init() {
        super.init(frame: .zero)
        addSubview(imageOutline)
        layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            imageOutline.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageOutline.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageOutline.heightAnchor.constraint(equalToConstant: 125),
            imageOutline.widthAnchor.constraint(equalToConstant: 125)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
            
    func configureBackground(with type: Pokemon.Element) {
        imageOutline.image = type.outlineImage
        backgroundColor = type.backgroundColor
                
    }
}

extension Pokemon.Element {
    var outlineImage: UIImage? {
        UIImage(named: "\(rawValue.lowercased())Outline")
    }
}

