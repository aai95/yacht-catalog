import UIKit
import Kingfisher

final class YachtCatalogTableViewCell: UITableViewCell, DefaultReusableCell {
    
    // MARK: Internal properties
    
    var catalogModel: YachtCatalogModel? {
        didSet {
            guard let catalogModel = catalogModel else {
                return
            }
            coverImage.kf.indicatorType = .activity
            coverImage.kf.setImage(with: URL(string: catalogModel.coverLink))
            
            nameLabel.text = catalogModel.name
        }
    }
    
    // MARK: Private properties
    
    private let coverImage: UIImageView = {
        let image = UIImageView()
        
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    // MARK: Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
        contentView.addSubview(coverImage)
        contentView.addSubview(nameLabel)
    }
    
    private func activateConstraints() {
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 180),
            
            coverImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            coverImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            coverImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            coverImage.heightAnchor.constraint(equalToConstant: 140),
            
            nameLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])
    }
}
