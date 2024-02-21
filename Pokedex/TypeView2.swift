import UIKit

final class TypeView2: UIView {
    var text: String? {
        get { typeLabel.text }
        set { typeLabel.text = newValue }
    }
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()

    private lazy var imageType: UIImageView = {
        let image = UIImageView(image: UIImage(named: "grass"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        image.layer.cornerRadius = 15
        return image
    }()

    private lazy var imageFrame: UIView = {
        let frame = UIView()
        frame.translatesAutoresizingMaskIntoConstraints = false
        frame.layer.cornerRadius = 15
        frame.backgroundColor = .white
        return frame
    }()

    init() {
        super.init(frame: .zero)
        addSubviews([typeLabel, imageFrame])
        imageFrame.addSubview(imageType)
        layer.cornerRadius = 15

        NSLayoutConstraint.activate([
            imageFrame.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageFrame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            imageFrame.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageFrame.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),

            imageType.widthAnchor.constraint(equalToConstant: 20),
            imageType.heightAnchor.constraint(equalToConstant: 20),
            imageType.topAnchor.constraint(equalTo: imageFrame.topAnchor, constant: 5),
            imageType.leadingAnchor.constraint(equalTo: imageFrame.leadingAnchor, constant: 5),
            imageType.centerXAnchor.constraint(equalTo: imageFrame.centerXAnchor),
            imageType.bottomAnchor.constraint(equalTo: imageFrame.bottomAnchor, constant: -5),

            typeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            typeLabel.leadingAnchor.constraint(equalTo: imageFrame.trailingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            typeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
