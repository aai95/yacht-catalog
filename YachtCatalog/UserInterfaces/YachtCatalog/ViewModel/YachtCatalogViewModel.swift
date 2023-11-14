import Foundation

final class YachtCatalogViewModel {
    
    // MARK: Private properties
    
    @Published
    private(set) var catalogModels: Array<YachtCatalogModel> = []
    
    // MARK: Internal functions
    
    func loadData() {
        fetchCatalogs()
    }
    
    // MARK: Private functions
    
    private func fetchCatalogs() {
        catalogModels = [
            YachtCatalogModel(id: 495, name: "Oyster 495"),
            YachtCatalogModel(id: 565, name: "Oyster 565"),
        ]
    }
}
