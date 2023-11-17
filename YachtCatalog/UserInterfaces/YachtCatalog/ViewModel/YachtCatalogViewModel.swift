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
            YachtCatalogModel(
                id: 495,
                coverLink: "495",
                name: "Oyster 495",
                description: "Oyster 495 description",
                photoLinks: [
                    "495",
                    "495",
                    "495",
                    "495",
                    "495",
                ]
            ),
            YachtCatalogModel(
                id: 565,
                coverLink: "565",
                name: "Oyster 565",
                description: "Oyster 565 description",
                photoLinks: [
                    "565",
                    "565",
                    "565",
                    "565",
                    "565",
                ]
            ),
        ]
    }
}
