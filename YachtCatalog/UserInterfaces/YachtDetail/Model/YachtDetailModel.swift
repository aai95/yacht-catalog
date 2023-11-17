import Foundation

struct YachtDetailModel {
    let id: Int
    let coverLink: String
    let name: String
    let description: String
    let photoLinks: Array<String>
    
    init(from model: YachtCatalogModel) {
        self.id = model.id
        self.coverLink = model.coverLink
        self.name = model.name
        self.description = model.description
        self.photoLinks = model.photoLinks
    }
}
