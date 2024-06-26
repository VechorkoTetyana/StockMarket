import UIKit

class MarketMoversCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var moneyLbl: UILabel!
    @IBOutlet weak var hiLowLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code. Changing colors and fonts.
        
        titleLbl.font = UIFont(name: FontName.interTightMedium.rawValue, size: 14)
        subtitleLbl.font = UIFont(name: FontName.interTightRegular.rawValue, size: 10)
        moneyLbl.font = UIFont(name: FontName.interTightMedium.rawValue, size: 14)
        hiLowLbl.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 12)
        
        coverView.layer.cornerRadius = 20
        coverView.layer.masksToBounds = true
       
        selectionStyle = .none
    }

    func configure(with modelPosition: ModelPosition) {
        titleLbl.text = modelPosition.title
        subtitleLbl.text = modelPosition.subtitle
        coverImage.image = modelPosition.coverImageName
        moneyLbl.text = modelPosition.portfolioValueNum
        hiLowLbl.text = modelPosition.stockPriceNum
    }
}
