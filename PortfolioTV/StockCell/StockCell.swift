import UIKit

class StockCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var coverView: UIView!
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
        
        coverView.layer.cornerRadius = 20
        coverView.layer.masksToBounds = true
    
        selectionStyle = .none
    }

    func configure(with modelPositionForBase: PortfolioData) {
        titleCompLbl.text = modelPositionForBase.title
        subtitleComLbl.text = modelPositionForBase.subtitle
        coverImage.image = UIImage(named: modelPositionForBase.title)
        
        portfolioValueNum.text = modelPositionForBase.portfolioValueNum
        stockPriceNum.text = modelPositionForBase.stockPriceNum
    }
    
    func setFirstCellCornerRadius() {
        backgroundCellView.layer.shadowColor = UIColor.black.cgColor
        backgroundCellView.layer.shadowOpacity = 0.1
        backgroundCellView.layer.shadowOffset = CGSize(width: 0, height: 2)
        backgroundCellView.layer.shadowRadius = 10
        backgroundCellView.layer.cornerRadius = 16
    }
}
