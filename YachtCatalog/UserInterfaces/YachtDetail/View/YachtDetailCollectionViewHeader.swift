import UIKit
import Kingfisher

final class YachtDetailCollectionViewHeader: UICollectionReusableView, DefaultReusableView {
    
    // MARK: Internal properties
    
    var detailModel: YachtDetailModel? {
        didSet {
            guard let detailModel = detailModel else {
                return
            }
            coverImage.kf.indicatorType = .activity
            coverImage.kf.setImage(with: URL(string: detailModel.coverLink))
            
            nameLabel.text = detailModel.name.uppercased()
            descriptionLabel.text = detailModel.description
        }
    }
    
    // MARK: Private properties
    
    private let coverImage: UIImageView = {
        let image = UIImageView()
        
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        image.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    private let mainStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.alignment = .center
        
        return stack
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
        
        coverImage.kf.cancelDownloadTask()
    }
    
    // MARK: Private functions
    
    private func addSubviews() {
        mainStack.addArrangedSubview(coverImage)
        mainStack.addArrangedSubview(nameLabel)
        mainStack.addArrangedSubview(descriptionLabel)
        
        self.addSubview(mainStack)
    }
    
    private func activateConstraints() {
        mainStack.setCustomSpacing(16, after: coverImage)
        mainStack.setCustomSpacing(8, after: nameLabel)
        
        NSLayoutConstraint.activate([
            coverImage.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            coverImage.heightAnchor.constraint(equalToConstant: 300),
            
            nameLabel.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor, constant: -16),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor, constant: 16),
            // workaround to get correct display of label and remove UIKit constraints conflict from log
            descriptionLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
        ])
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        let mainStackTrailingConstraint = mainStack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let mainStackBottomConstraint = mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        mainStackTrailingConstraint.priority = .defaultHigh // resolve conflict with default constraint width = 0
        mainStackBottomConstraint.priority = .defaultHigh // resolve conflict with default constraint height = 0
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: self.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackTrailingConstraint,
            mainStackBottomConstraint,
        ])
    }
}
