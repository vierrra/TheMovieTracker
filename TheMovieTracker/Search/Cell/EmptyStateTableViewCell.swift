//

import UIKit

class EmptyStateTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: EmptyStateTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Filme não encontrado"
        label.textAlignment = .center
        label.textColor = .lightGray
        label.backgroundColor = .viewBackground
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private func setup() {
        self.buildViewHierarchy()
        self.configConstraints()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(emptyLabel)
    }
    
    private func configConstraints() {
        emptyLabel.anchor(leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        emptyLabel.yAnchor(yAnchor: contentView.centerYAnchor)
    }
}
