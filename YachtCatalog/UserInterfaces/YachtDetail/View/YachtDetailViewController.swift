import UIKit
import Combine

final class YachtDetailViewController: UIViewController {
    
    // MARK: Private properties
    
    private let widthParameters = CollectionWidthParameters(cellsNumber: 2, leftInset: 16, rightInset: 16, interCellSpacing: 10)
    private let viewModel: YachtDetailViewModel
    private var subscribers = Array<AnyCancellable>()
    
    private lazy var yachtCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        collection.register(YachtDetailCollectionViewCell.self)
        collection.register(YachtDetailCollectionViewHeader.self, of: UICollectionView.elementKindSectionHeader)
        
        collection.dataSource = self
        collection.delegate = self
        
        collection.contentInsetAdjustmentBehavior = .never // ignore safe area insets on all edges
        return collection
    }()
    
    // MARK: Initializers
    
    init(viewModel: YachtDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        addSubviews()
        activateConstraints()
        subscribeToPublishers()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        var insets = view.safeAreaInsets
        insets.top = 0 // ignore only top safe area inset
        yachtCollection.contentInset = insets
    }
    
    // MARK: Private functions
    
    private func setupNavigationBar() {
        guard let bar = navigationController?.navigationBar else {
            return
        }
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        bar.standardAppearance = appearance
        bar.topItem?.backBarButtonItem = UIBarButtonItem()
        bar.tintColor = .black
    }
    
    private func addSubviews() {
        view.addSubview(yachtCollection)
    }
    
    private func activateConstraints() {
        yachtCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            yachtCollection.topAnchor.constraint(equalTo: view.topAnchor),
            yachtCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yachtCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            yachtCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func subscribeToPublishers() {
        viewModel.$detailModel
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else {
                    return
                }
                self.yachtCollection.reloadData()
            })
            .store(in: &subscribers)
    }
}

// MARK: - UICollectionViewDataSource

extension YachtDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.detailModel.photoLinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: YachtDetailCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.photoLink = viewModel.detailModel.photoLinks[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header: YachtDetailCollectionViewHeader = collectionView.dequeueReusableSupplementaryView(of: kind, for: indexPath)
        header.detailModel = viewModel.detailModel
        return header
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension YachtDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.bounds.width - widthParameters.widthInsets
        let cellWidth =  availableWidth / CGFloat(widthParameters.cellsNumber)
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: widthParameters.leftInset, bottom: 16, right: widthParameters.rightInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let indexPath = IndexPath(item: 0, section: section)
        let headerView = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath)
        let targetSize = CGSize(width: collectionView.bounds.width, height: UIView.layoutFittingCompressedSize.height)
        
        return headerView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
    }
}
