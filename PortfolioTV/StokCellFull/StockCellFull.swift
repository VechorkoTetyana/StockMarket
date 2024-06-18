import UIKit

class StockCellFull: UITableViewCell {

    @IBOutlet weak var lineChart: LineChartView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lineChart.lineColor = .red
        titleLbl.font = UIFont(name: FontName.interTightBold.rawValue, size: 14)
    }

    func configure(with data: [Double]) {
        lineChart.data = data
    }

}
