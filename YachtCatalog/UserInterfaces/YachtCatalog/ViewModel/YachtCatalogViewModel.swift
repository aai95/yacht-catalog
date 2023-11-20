import Foundation

final class YachtCatalogViewModel {
    
    // MARK: Private properties
    
    @Published
    private(set) var catalogModels: Array<YachtCatalogModel> = []
    
    // MARK: Internal functions
    
    func loadData() {
        catalogModels = DataProvider.shared.provideData()
    }
}
