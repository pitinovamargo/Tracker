//
//  FiltersViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 20.08.2023.
//

import UIKit

final class FiltersViewController: UIViewController {
    
    let cellReuseIdentifier = "FiltersViewController"
    var selectedFilter: String?
    
    private let header: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Фильтры"
        header.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        header.textColor = .ypBlackDay
        return header
    }()
    
    private let filtersTableView: UITableView = {
        let filtersTableView = UITableView()
        filtersTableView.separatorStyle = .none
        filtersTableView.layer.cornerRadius = 16
        filtersTableView.translatesAutoresizingMaskIntoConstraints = false
        return filtersTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .ypWhiteDay
        view.addSubview(header)
        view.addSubview(filtersTableView)
        
        filtersTableView.delegate = self
        filtersTableView.dataSource = self
        filtersTableView.register(FilterCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 26),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filtersTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 38),
            filtersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            filtersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            filtersTableView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
}

// MARK: - UITableViewDelegate
extension FiltersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? FilterCell {
            cell.done(with: UIImage(named: "Done") ?? UIImage())
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let separatorInset: CGFloat = 16
        let separatorWidth = tableView.bounds.width - separatorInset * 2
        let separatorHeight: CGFloat = 1.0
        let separatorX = separatorInset
        let separatorY = cell.frame.height - separatorHeight
        
        let isLastCell = indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1
        
        if !isLastCell {
            let separatorView = UIView(frame: CGRect(x: separatorX, y: separatorY, width: separatorWidth, height: separatorHeight))
            separatorView.backgroundColor = .ypGray
            cell.addSubview(separatorView)
        }
    }
}

// MARK: - UITableViewDataSource
extension FiltersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? FilterCell else { return UITableViewCell() }
        
        var title = ""
            
            switch indexPath.row {
            case 0:
                title = "Все трекеры"
            case 1:
                title = "Трекеры на сегодня"
            case 2:
                title = "Завершенные"
            case 3:
                title = "Незавершенные"
            default:
                break
            }
            
            cell.update(with: title)
        
        let isLastCell = indexPath.row == 3
        if isLastCell {
            cell.layer.cornerRadius = 16
            cell.layer.masksToBounds = true
            cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
            cell.layer.cornerRadius = 0
            cell.layer.masksToBounds = false
        }
        return cell
    }
}
