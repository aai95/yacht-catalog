import UIKit

protocol DefaultReusableCell {
    static var defaultReuseIdentifier: String { get }
}

// MARK: - UITableViewCell

extension DefaultReusableCell where Self: UITableViewCell {
    
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? NSStringFromClass(self)
    }
}

extension UITableView {
    
    func register<Cell: UITableViewCell>(_: Cell.Type) where Cell: DefaultReusableCell {
        register(Cell.self, forCellReuseIdentifier: Cell.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>() -> Cell where Cell: DefaultReusableCell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.defaultReuseIdentifier) as? Cell else {
            assertionFailure("Failed to dequeue reusable cell with identifier \(Cell.defaultReuseIdentifier)")
            return Cell()
        }
        return cell
    }
}

// MARK: - UICollectionViewCell

extension DefaultReusableCell where Self: UICollectionViewCell {
    
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? NSStringFromClass(self)
    }
}

extension UICollectionView {
    
    func register<Cell: UICollectionViewCell>(_: Cell.Type) where Cell: DefaultReusableCell {
        register(Cell.self, forCellWithReuseIdentifier: Cell.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell where Cell: DefaultReusableCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.defaultReuseIdentifier, for: indexPath) as? Cell else {
            assertionFailure("Failed to dequeue reusable cell with identifier \(Cell.defaultReuseIdentifier) for index path \(indexPath)")
            return Cell()
        }
        return cell
    }
}

// MARK: - UICollectionReusableView

extension DefaultReusableCell where Self: UICollectionReusableView {
    
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? NSStringFromClass(self)
    }
}

extension UICollectionView {
    
    func register<View: UICollectionReusableView>(_: View.Type, of kind: String) where View: DefaultReusableCell {
        register(View.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: View.defaultReuseIdentifier)
    }
    
    func dequeueReusableSupplementaryView<View: UICollectionReusableView>(of kind: String, for indexPath: IndexPath) -> View where View: DefaultReusableCell {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: View.defaultReuseIdentifier, for: indexPath) as? View else {
            assertionFailure("Failed to dequeue reusable supplementary view of kind \(kind) with identifier \(View.defaultReuseIdentifier) for index path \(indexPath)")
            return View()
        }
        return view
    }
}
