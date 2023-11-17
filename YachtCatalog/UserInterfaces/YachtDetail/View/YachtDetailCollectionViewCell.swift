import UIKit

final class YachtDetailCollectionViewCell: UICollectionViewCell, DefaultReusableCell {
    
    // MARK: Internal properties
    
    var photoLink: String? {
        didSet {
            guard let photoLink = photoLink else {
                return
            }
            yachtImage.image = UIImage(named: "\(photoLink).jpg")
        }
    }
    
    // MARK: Private properties
    
    private let yachtImage: UIImageView = {
        let image = UIImageView()
        
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        
        return image
    }()
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private functions
    
    private func addSubviews() {
        contentView.addSubview(yachtImage)
    }
    
    private func activateConstraints() {
        yachtImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            yachtImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            yachtImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yachtImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            yachtImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
