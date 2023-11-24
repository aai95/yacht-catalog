import UIKit
import Kingfisher

final class YachtDetailCollectionViewCell: UICollectionViewCell, DefaultReusableView {
    
    // MARK: Internal properties
    
    var photoLink: String? {
        didSet {
            guard let photoLink = photoLink else {
                return
            }
            photoImage.kf.indicatorType = .activity
            photoImage.kf.setImage(with: URL(string: photoLink))
        }
    }
    
    // MARK: Private properties
    
    private let photoImage: UIImageView = {
        let image = UIImageView()
        
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        
        image.contentMode = .scaleAspectFill
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
    
    // MARK: Override functions
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        photoImage.kf.cancelDownloadTask()
    }
    
    // MARK: Private functions
    
    private func addSubviews() {
        contentView.addSubview(photoImage)
    }
    
    private func activateConstraints() {
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
