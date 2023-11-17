import UIKit

final class YachtDetailCollectionViewHeader: UICollectionReusableView, DefaultReusableCell {
    
    // MARK: Internal properties
    
    var detailModel: YachtDetailModel? {
        didSet {
            guard let detailModel = detailModel else {
                return
            }
            coverImage.image = UIImage(named: "\(detailModel.coverLink).jpg")
            nameLabel.text = detailModel.name
            descriptionLabel.text = detailModel.description
        }
    }
    
    // MARK: Private properties
    
    private let coverImage: UIImageView = {
        let image = UIImageView()
        
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        image.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return image
    }()
    
    private let nameLabel: UILabel = {
        return UILabel()
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var mainStack: UIStackView = {
        let mainStack = UIStackView()
        
        mainStack.axis = .vertical
        mainStack.alignment = .center
        
        mainStack.addArrangedSubview(coverImage)
        mainStack.addArrangedSubview(nameLabel)
        mainStack.addArrangedSubview(descriptionLabel)
        
        mainStack.setCustomSpacing(16, after: coverImage)
        mainStack.setCustomSpacing(8, after: nameLabel)
        
        NSLayoutConstraint.activate([
            coverImage.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            coverImage.heightAnchor.constraint(equalToConstant: 300),
            
            nameLabel.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor, constant: -16),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor, constant: -16),
        ])
        return mainStack
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
        addSubview(mainStack)
    }
    
    private func activateConstraints() {
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
