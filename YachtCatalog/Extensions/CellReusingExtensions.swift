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
