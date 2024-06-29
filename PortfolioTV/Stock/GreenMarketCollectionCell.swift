import UIKit

class GreenMarketCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var logoMarketView: UIImageView!
    @IBOutlet weak var titleMarketLbl: UILabel!
    @IBOutlet weak var subtitleMarketLbl: UILabel!
    @IBOutlet weak var moneyLbl: UILabel!
    @IBOutlet weak var hiLowLbl: UILabel!
    @IBOutlet weak var lineChartView: LineChartView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
   
        titleMarketLbl.font = UIFont(name: FontName.interTightBold.rawValue, size: 14)
        subtitleMarketLbl.font = UIFont(name: FontName.interTightRegular.rawValue, size: 10)
        moneyLbl.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 14)
        hiLowLbl.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 12)
        
        configureBoarders()
    }
    
    func configure(_ modelPosition: ModelPosition) {
        logoMarketView.image = UIImage(named: modelPosition.title)
        titleMarketLbl.text = modelPosition.subtitle
        subtitleMarketLbl.text = modelPosition.title
        moneyLbl.text = modelPosition.portfolioValueNum
        hiLowLbl.text = modelPosition.stockPriceNum        
        lineChartView.data = modelPosition.graphData
        hiLowLbl.textColor = modelPosition.isGreen ? UIColor(hex: "#16A34A") : UIColor(hex: "#E20029")
        lineChartView.lineColor = (modelPosition.isGreen ? UIColor(hex: "#42A06D") : UIColor(hex: "#E20029")!) ?? .gray
        
        lineChartView.shadowColor = (modelPosition.isGreen ? UIColor(hex: "#42A06D")?.withAlphaComponent(0.2) : UIColor(hex: "#E20029")?.withAlphaComponent(0.2)) ?? .clear
    }
    
    private func configureBoarders() {
            self.layer.borderColor = UIColor(hex: "#EAEAEA")?.cgColor
            self.layer.borderWidth = 1.0
            self.layer.cornerRadius = 12.0
            self.layer.masksToBounds = true
        }
}
