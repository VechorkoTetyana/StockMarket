import UIKit

class BuyStockController: UIViewController {
    
    @IBOutlet weak var greyView: UIView!
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var bottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var stockAmountTextField: UITextField!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var viewModel: PortfolioSellAndBuyViewModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureButton()
        configureKeyboard()
    }
    
    func configure() {
        
        let details = viewModel.portfolioData
        
        coverImage.image = UIImage(named: details.title)
        titleLbl.text = details.title
        subtitleLbl.text = details.subtitle
        priceLbl.text = details.portfolioValueNum
        stockAmountTextField.text = details.portfolioValueNum
        
        stockAmountTextField.keyboardType = .numberPad
                
        roundedView.layer.cornerRadius = 20
        roundedView.layer.masksToBounds = true
        
        greyView.layer.cornerRadius = 16
        greyView.layer.masksToBounds = true
        
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
                self?.buyStock(with: "sample content")
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
    func configureKeyboard() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let endFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        else { return }
        
        let isKeyboardPresent = endFrame.origin.y < UIScreen.main.bounds.size.height
        
        // if keyboard will hide
        
        if !isKeyboardPresent {
            bottomConstraints.constant = 0
        } else { // if keyboard will show
            let bottomHeight = 8 + endFrame.height - view.safeAreaInsets.bottom
            bottomConstraints.constant = -bottomHeight
       }
    }

    func buyStock(with content: String) {
        viewModel.buyStock(with: content)
    }
    
/* for SellStockController
 
 func sellStock(with content: String) {
        Task {
            do {
                try await repository.deletePrice(content)
            } catch {
              print(error)
            }
        }
    }*/
    
}
    
