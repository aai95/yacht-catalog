import Foundation

final class DataProvider {
    
    // MARK: Internal properties
    
    static let shared = DataProvider()
    
    // MARK: Initializers
    
    private init() {}
    
    // MARK: Internal functions
    
    func provideData() -> Array<YachtCatalogModel> {
        return [
            YachtCatalogModel(
                id: 495,
                coverLink: "https://oysteryachts.com/assets/media-slider/Oyster-495-50-Foot-Sailing-Yacht-Sailing-Palma-Side-Shot__Resampled.jpg",
                name: "Oyster 495",
                description: "Winner of European Yacht of the Year 2023. The Oyster 495 is a new breed of 50 foot sailing yacht.",
                photoLinks: [
                    "https://oysteryachts.com/assets/media-slider/Oyster-495-50-Foot-Sailing-Yacht-Sailing-Palma-Waves-Crashing-On-Bow__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/Oyster-495-50-Foot-Sailing-Yacht-Sailing-Palma-Waves-Sail-Bow__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/Oyster-495-50-Foot-Sailing-Yacht-Sailing-Palma-Sailing-Towards-You__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/Oyster-495-50-Foot-Sailing-Yacht-Sailing-Palma-Stern-Shot__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/Oyster-495-50-Foot-Sailing-Yacht-Sailing-Palma-Waves-Sail-Bow-Towards-You__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/Oyster-495-50-Foot-Sailing-Yacht-Sailing-Palma-Side-Shot__Resampled.jpg",
                ]
            ),
            YachtCatalogModel(
                id: 565,
                coverLink: "https://oysteryachts.com/assets/media-slider/Oyster-565-Cruising-3__Resampled.jpg",
                name: "Oyster 565",
                description: "An award winning sub 60 foot sailing yacht. Well-appointed with a powerful sail plan, she is ideal for shorthanded sailing.",
                photoLinks: [
                    "https://oysteryachts.com/assets/media-slider/Oyster-565-Cruising__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/Oyster-565-Cruising-2__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/Oyster-565-Cruising-3__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/Oyster-565-Cruising-10__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/Oyster-565-Cruising-4__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/Oyster-565-Cruising-5__Resampled.jpg",
                ]
            ),
            YachtCatalogModel(
                id: 675,
                coverLink: "https://oysteryachts.com/assets/media-slider/bluewater-70-foot-sailing-yacht__Resampled.jpg",
                name: "Oyster 675",
                description: "A versatile sub 70 foot ocean sailboat that offers the perfect combination of space and sailing capability.",
                photoLinks: [
                    "https://oysteryachts.com/assets/media-slider/oyster-bluewater-sailing-yacht__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/couple-sailing-70-foot-bluewater-sailing-yacht__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/bluewater-70-foot-sailing-yacht__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/70-foot-bluewater-sailing-yacht-at-full-power__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/sailing-yacht-crashing-through-the-waves__Resampled.jpg",
                    "https://oysteryachts.com/assets/media-slider/oyster-70-foot-bluewater-sailing-yacht__Resampled.jpg",
                ]
            ),
            YachtCatalogModel(
                id: 745,
                coverLink: "https://oysteryachts.com/assets/Uploads/Oyster-745-75-Foot-Luxury-Sailing-Yacht-FW__Resampled.jpg",
                name: "Oyster 745",
                description: "A crewed 75 foot cruising yacht designed for very big adventures.",
                photoLinks: [
                    "https://oysteryachts.com/assets/Uploads/Oyster-745-75-Foot-Sailing-Yacht-Exterior-Cruising-FW-v4__Resampled.jpg",
                    "https://oysteryachts.com/assets/Uploads/Oyster-745-75-Foot-Luxury-Sailing-Yacht-FW__Resampled.jpg",
                    "https://oysteryachts.com/assets/Uploads/Oyster-745-75-Foot-Sailing-Yacht-Exterior-Cruising-Bow-FW-v3__Resampled.jpg",
                    "https://oysteryachts.com/assets/Uploads/Oyster-745-75-Foot-Luxury-Sailing-Yacht-Exterior-Side-View-FW__Resampled.jpg",
                    "https://oysteryachts.com/assets/Uploads/Oyster-745-75-Foot-Sailing-Yacht-Aerial-View-FW__Resampled.jpg",
                    "https://oysteryachts.com/assets/Uploads/Oyster-745-75-Foot-Sailing-Yacht-Exterior-Cruising-Cockpit-FW-v2__Resampled.jpg",
                ]
            ),
            YachtCatalogModel(
                id: 885,
                coverLink: "https://oysteryachts.com/assets/Uploads/Oyster-885-90-Foot-Sailing-Yacht-Exterior-Cruising-1__Resampled.jpg",
                name: "Oyster 885",
                description: "An exhilarating 90 foot sailing yacht, delivering comfort and safety.",
                photoLinks: [
                    "https://oysteryachts.com/assets/Uploads/oyster885-90foot-luxury-sailboat__Resampled.jpg",
                    "https://oysteryachts.com/assets/Uploads/Oyster-885-90-Foot-Sailing-Yacht-Exterior-Palma-Sailing__Resampled.jpg",
                    "https://oysteryachts.com/assets/Uploads/Oyster-885-90-Foot-Sailing-Yacht-Exterior-Cruising-Speed-Shot__Resampled.jpg",
                    "https://oysteryachts.com/assets/Uploads/Oyster-885-90-Foot-Sailing-Yacht-Exterior-Cruising-1__Resampled.jpg",
                    "https://oysteryachts.com/assets/Uploads/Oyster-885-90-Foot-Sailing-Yacht-Exterior-Sailing-Landscape__Resampled.jpg",
                    "https://oysteryachts.com/assets/Uploads/Oyster-885-90-Foot-Sailing-Yacht-Exterior-Anchored__Resampled.jpg",
                ]
            ),
        ]
    }
}
