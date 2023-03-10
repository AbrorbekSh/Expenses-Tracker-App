import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let horizontalMargin: CGFloat = 2.5
        static let verticalMargin: CGFloat = 2.5
    }
    
    //MARK: - Init
    
    static let identifier = String(describing: CustomTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - UI elements
    private let newView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.opacity = 0.4
        return view
    }()
    
    let transactionAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(type: .semibold, size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(type: .medium, size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(type: .medium, size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        giveGradientToView()
        activateLayout()
    }
    
    //MARK: - Private methods
    
    private func addSubviews(){
        contentView.addSubview(newView)
        contentView.addSubview(transactionAmountLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(dateLabel)
    }
    
    private func giveGradientToView(){
        let gradient = makeGradient()
        newView.layer.addSublayer(gradient)
        newView.layer.cornerRadius = 15
    }
    
    private func makeGradient() -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.frame = newView.bounds
        let color1 = UIColor(hexString: "#2193b0")
        let color2 = UIColor(hexString: "#6dd5ed")
        gradient.colors = [
            color1.cgColor,
            color2.cgColor,
        ]
        return gradient
    }

    
    private func activateLayout(){
        NSLayoutConstraint.activate([
            newView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.verticalMargin),
            newView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.verticalMargin),
            newView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalMargin),
            newView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalMargin),
            
            transactionAmountLabel.centerYAnchor.constraint(equalTo: newView.centerYAnchor),
            transactionAmountLabel.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: 10),
            transactionAmountLabel.widthAnchor.constraint(equalToConstant: newView.frame.width/3-10),
            transactionAmountLabel.heightAnchor.constraint(equalTo: newView.heightAnchor),
            
            categoryLabel.centerXAnchor.constraint(equalTo: newView.centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: newView.centerYAnchor),
            categoryLabel.widthAnchor.constraint(equalToConstant: newView.frame.width/3-10),
            categoryLabel.heightAnchor.constraint(equalTo: newView.heightAnchor),

            dateLabel.trailingAnchor.constraint(equalTo: newView.trailingAnchor, constant: -10),
            dateLabel.centerYAnchor.constraint(equalTo: newView.centerYAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: newView.frame.width/3-10),
            dateLabel.heightAnchor.constraint(equalTo: newView.heightAnchor),
        ])
    }
}
