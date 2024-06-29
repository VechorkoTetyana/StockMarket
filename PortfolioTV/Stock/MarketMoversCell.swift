import UIKit

class MarketMoversCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var moneyLbl: UILabel!
    @IBOutlet weak var hiLowLbl: UILabel!
    
    var data: [Double] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLbl.font = UIFont(name: FontName.interTightBold.rawValue, size: 14)
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
        coverImage.image = UIImage(named: modelPosition.title)
        moneyLbl.text = modelPosition.portfolioValueNum
        hiLowLbl.text = modelPosition.stockPriceNum
        hiLowLbl.textColor = modelPosition.isGreen ? UIColor(hex: "#16A34A") : UIColor(hex: "#E20029")
        lineChartView.data = modelPosition.graphData
        lineChartView.lineColor = (modelPosition.isGreen ? UIColor(hex: "#16A34A") : UIColor(hex: "#E20029")!) ?? .gray
        lineChartView.shadowColor = (modelPosition.isGreen ? UIColor(hex: "#42A06D")?.withAlphaComponent(0.2) : UIColor(hex: "#E20029")?.withAlphaComponent(0.2)) ?? .clear
    }
}
