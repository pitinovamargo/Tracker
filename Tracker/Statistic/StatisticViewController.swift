//
//  StatisticViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 07.07.2023.
//

import UIKit

final class StatisticViewController: UIViewController {
    
    let cellReuseIdentifier = "StatisticViewController"
    var trackersViewController: TrackersViewController?
    
    private let header: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Статистика"
        header.textColor = .ypBlackDay
        header.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return header
    }()
    
    private let emptyStatistic: UIImageView = {
        let emptySearch = UIImageView()
        emptySearch.translatesAutoresizingMaskIntoConstraints = false
        emptySearch.image = UIImage(named: "empty statistic")
        return emptySearch
    }()
    
    private let emptyStatisticText: UILabel = {
        let emptySearchText = UILabel()
        emptySearchText.translatesAutoresizingMaskIntoConstraints = false
        emptySearchText.text = "Анализировать пока нечего"
        emptySearchText.textColor = .ypBlackDay
        emptySearchText.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return emptySearchText
    }()
    
    private let statisticTableView: UITableView = {
        let statisticTableView = UITableView()
        statisticTableView.separatorStyle = .none
        statisticTableView.layer.cornerRadius = 16
        statisticTableView.translatesAutoresizingMaskIntoConstraints = false
        return statisticTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypWhiteDay
        addSubviews()
        
        statisticTableView.backgroundColor = .ypWhiteDay
        statisticTableView.delegate = self
        statisticTableView.dataSource = self
        statisticTableView.register(StatisticCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        statisticTableView.reloadData()
                
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            header.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emptyStatistic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStatistic.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 246),
            emptyStatistic.heightAnchor.constraint(equalToConstant: 80),
            emptyStatistic.widthAnchor.constraint(equalToConstant: 80),
            emptyStatisticText.centerXAnchor.constraint(equalTo: emptyStatistic.centerXAnchor),
            emptyStatisticText.topAnchor.constraint(equalTo: emptyStatistic.bottomAnchor, constant: 8),
            statisticTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 77),
            statisticTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            statisticTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            statisticTableView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        statisticTableView.reloadData()
    }
    
    private func addSubviews() {
        view.addSubview(header)
        view.addSubview(emptyStatistic)
        view.addSubview(emptyStatisticText)
        view.addSubview(statisticTableView)
    }
    
    private func showPlaceholder() {
        guard let trackersViewController = trackersViewController else { return }
        
        if trackersViewController.completedTrackers.count > 0 {
            emptyStatistic.isHidden = true
            emptyStatisticText.isHidden = true
            statisticTableView.isHidden = false
        } else {
            emptyStatistic.isHidden = false
            emptyStatisticText.isHidden = false
            statisticTableView.isHidden = true
        }
    }
}

// MARK: - UITableViewDelegate
extension StatisticViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
}

// MARK: - UITableViewDataSource
extension StatisticViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? StatisticCell else { return UITableViewCell() }
        
        var title = ""
        
        switch indexPath.row {
        case 0:
            title = "Лучший период"
        case 1:
            title = "Идеальные дни"
        case 2:
            title = "Трекеров завершено"
        case 3:
            title = "Среднее значение"
        default:
            break
        }
        
        showPlaceholder()
        
        var count = ""
        
        switch indexPath.row {
        case 0:
            count = "0"
        case 1:
            count = "0"
        case 2:
            count = "\(trackersViewController?.completedTrackers.count ?? 0)"
        case 3:
            count = "0"
        default:
            break
        }
        
        cell.update(with: title, count: count)
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = false
        
        return cell
    }
}
