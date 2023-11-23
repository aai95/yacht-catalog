import Foundation

final class YachtCatalogViewModel {
    
    // MARK: Private properties
    
    @Published
    private(set) var catalogModels: Array<YachtCatalogModel> = []
    
    // MARK: Internal functions
    
    func loadCatalogs() {
        catalogModels = DataProvider.shared.provideData()
        sortCatalogs(by: SortTypeStorage.shared.sortType)
    }
    
    func sortCatalogs(by type: SortType) {
        switch type {
        case .ascending:
            catalogModels.sort(by: { $0.id < $1.id })
        case .descending:
            catalogModels.sort(by: { $0.id > $1.id })
        }
        SortTypeStorage.shared.sortType = type
    }
}
