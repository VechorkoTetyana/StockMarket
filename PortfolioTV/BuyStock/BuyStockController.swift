import Foundation
import UIKit

class BuyStockController: UIViewController {
    
    @IBOutlet weak var greyView: UIView!
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var stockAmountLbl: UILabel!
    @IBOutlet weak var confirmBtn: UIButton!
    
    var details: ModelPosition!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureButton()
    }
    
    func configure() {
        coverImage.image = UIImage(named: details.title)
        titleLbl.text = details.title
        subtitleLbl.text = details.subtitle
        priceLbl.text = details.portfolioValueNum
        stockAmountLbl.text = details.stockPriceNum
        
        roundedView.layer.cornerRadius = 20
        roundedView.layer.masksToBounds = true
        
        greyView.layer.cornerRadius = 16
        greyView.layer.masksToBounds = true
        
    }
    
    private func list() -> [ModelPosition] {
        
        var list = [ModelPosition]()
        
        list.append(ModelPosition(
            title: "NFLX",
            subtitle: "Netflix, Inc",
            portfolioValueNum: "$88.91",
            stockPriceNum: "$2,111.03",
            lineChart: .clear,
            graphData: [],
            isGreen: true
        ))
        
        return list
    }
    
    private func configureButton() {
        confirmBtn.setTitleColor(.white, for: .normal)
        confirmBtn.titleLabel?.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 14)
    }
    
    @IBAction func confirmBtnTapped(_ sender: Any) {
        let alert = UIAlertController(
            title: "Please confirm purchase",
            message: "You’re buying NFLX at $88.91 per share for the amount of $114.00.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "Confirm",
            style: .default,
            handler: { [weak self] _ in
//                self?.deleteListAndDismiss()
            }
        ))
        
        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel
        ))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
    
