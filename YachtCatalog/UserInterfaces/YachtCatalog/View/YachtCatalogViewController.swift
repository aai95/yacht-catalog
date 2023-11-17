import UIKit
import Combine

final class YachtCatalogViewController: UIViewController {
    
    // MARK: Private properties
    
    private let viewModel = YachtCatalogViewModel()
    private var subscribers = Array<AnyCancellable>()
    
    private lazy var catalogTable: UITableView = {
        let table = UITableView(frame: .zero)
        
        table.register(YachtCatalogTableViewCell.self)
        table.dataSource = self
        table.delegate = self
        
        table.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        table.separatorStyle = .none
        return table
    }()
    
    // MARK: Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addSubviews()
        activateConstraints()
        subscribeToPublishers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if viewModel.catalogModels.isEmpty {
            viewModel.loadData()
        }
    }
    
    // MARK: Private functions
    
    private func addSubviews() {
        view.addSubview(catalogTable)
    }
    
    private func activateConstraints() {
        catalogTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            catalogTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            catalogTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            catalogTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            catalogTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func subscribeToPublishers() {
        viewModel.$catalogModels
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else {
                    return
                }
                self.catalogTable.reloadData()
            })
            .store(in: &subscribers)
    }
}

// MARK: - UITableViewDataSource

extension YachtCatalogViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.catalogModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: YachtCatalogTableViewCell = tableView.dequeueReusableCell()
        cell.catalogModel = viewModel.catalogModels[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate

extension YachtCatalogViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailController = YachtDetailViewController(
            viewModel: YachtDetailViewModel(
                detailModel: YachtDetailModel(from: viewModel.catalogModels[indexPath.row])
            )
        )
        navigationController?.pushViewController(detailController, animated: true)
    }
}
