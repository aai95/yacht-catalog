import UIKit

protocol DefaultReusableView {
    static var defaultReuseIdentifier: String { get }
}

// MARK: - UITableViewCell

extension DefaultReusableView where Self: UITableViewCell {
    
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? NSStringFromClass(self)
    }
}

extension UITableView {
    
    func registerDefault<Cell: UITableViewCell>(_: Cell.Type) where Cell: DefaultReusableView {
        register(Cell.self, forCellReuseIdentifier: Cell.defaultReuseIdentifier)
    }
    
    func dequeueDefaultReusableCell<Cell: UITableViewCell>() -> Cell where Cell: DefaultReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.defaultReuseIdentifier) as? Cell else {
            assertionFailure("Failed to dequeue reusable cell with identifier \(Cell.defaultReuseIdentifier)")
            return Cell()
        }
        return cell
    }
}

// MARK: - UICollectionViewCell

extension DefaultReusableView where Self: UICollectionViewCell {
    
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? NSStringFromClass(self)
    }
}

extension UICollectionView {
    
    func registerDefault<Cell: UICollectionViewCell>(_: Cell.Type) where Cell: DefaultReusableView {
        register(Cell.self, forCellWithReuseIdentifier: Cell.defaultReuseIdentifier)
    }
    
    func dequeueDefaultReusableCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell where Cell: DefaultReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.defaultReuseIdentifier, for: indexPath) as? Cell else {
            assertionFailure("Failed to dequeue reusable cell with identifier \(Cell.defaultReuseIdentifier) for index path \(indexPath)")
            return Cell()
        }
        return cell
    }
}

// MARK: - UICollectionReusableView

extension DefaultReusableView where Self: UICollectionReusableView {
    
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? NSStringFromClass(self)
    }
}

extension UICollectionView {
    
    func registerDefaultHeader<View: UICollectionReusableView>(_: View.Type) where View: DefaultReusableView {
        register(View.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: View.defaultReuseIdentifier)
    }
    
    func registerDefaultFooter<View: UICollectionReusableView>(_: View.Type) where View: DefaultReusableView {
        register(View.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: View.defaultReuseIdentifier)
    }
    
    func dequeueDefaultReusableSupplementaryView<View: UICollectionReusableView>(of kind: String, for indexPath: IndexPath) -> View where View: DefaultReusableView {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: View.defaultReuseIdentifier, for: indexPath) as? View else {
            assertionFailure("Failed to dequeue reusable supplementary view of kind \(kind) with identifier \(View.defaultReuseIdentifier) for index path \(indexPath)")
            return View()
        }
        return view
    }
}
