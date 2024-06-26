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
        configure(ModelPosition(
            title: "",
            subtitle: "",
            coverImageName: .adobe,
            portfolioValueNum: "",
            stockPriceNum: "",
            lineChart: .clear))
    }
    
    func configure(_ modelPosition: ModelPosition) {
        logoMarketView.image = modelPosition.coverImageName
        titleMarketLbl.text = modelPosition.title
        subtitleMarketLbl.text = modelPosition.subtitle
        moneyLbl.text = modelPosition.portfolioValueNum
        hiLowLbl.text = modelPosition.stockPriceNum
        lineChartView.lineColor = modelPosition.lineChart
    }
}
