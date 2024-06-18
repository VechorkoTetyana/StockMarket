import Foundation
import UIKit

struct ModelPosition {
    let title: String
    let subtitle: String
    let coverImageName: UIImage
    
    let portfolioValueNum: String
    let stockPriceNum: String
    
    init(
        title: String,
        subtitle: String,
        coverImageName: UIImage,
        portfolioValueNum: String,
        stockPriceNum: String
    ) {
        self.title = title
        self.subtitle = subtitle
        self.coverImageName = coverImageName
        self.portfolioValueNum = portfolioValueNum
        self.stockPriceNum = stockPriceNum
    }
}
