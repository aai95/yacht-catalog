import Foundation

final class YachtDetailViewModel {
    
    // MARK: Internal properties
    
    @Published
    private(set) var detailModel: YachtDetailModel
    
    // MARK: Initializers
    
    init(detailModel: YachtDetailModel) {
        self.detailModel = detailModel
    }
}
