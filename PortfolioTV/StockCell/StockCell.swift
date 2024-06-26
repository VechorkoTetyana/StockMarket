import UIKit

class StockCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleCompLbl: UILabel!
    @IBOutlet weak var subtitleComLbl: UILabel!
    @IBOutlet weak var portfolioValueNum: UILabel!
    @IBOutlet weak var stockPriceNum: UILabel!
    @IBOutlet weak var backgroundCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code. Changing colors and fonts.
        
        titleCompLbl.font = UIFont(name: FontName.interTightBold.rawValue, size: 14)
        subtitleComLbl.font = UIFont(name: FontName.interTightRegular.rawValue, size: 10)
        portfolioValueNum.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 18)
        stockPriceNum.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 18)
    }

    func configure(with modelPosition: ModelPosition) {
        titleCompLbl.text = modelPosition.title
        subtitleComLbl.text = modelPosition.subtitle
        iconImageView.image = modelPosition.coverImageName
        
        portfolioValueNum.text = modelPosition.portfolioValueNum
        stockPriceNum.text = modelPosition.stockPriceNum
    }
    
    func setFirstCellCornerRadius() {
        backgroundCellView.layer.shadowColor = UIColor.black.cgColor
        backgroundCellView.layer.shadowOpacity = 0.1
        backgroundCellView.layer.shadowOffset = CGSize(width: 0, height: 2)
        backgroundCellView.layer.shadowRadius = 10
        backgroundCellView.layer.cornerRadius = 16
    }
}
