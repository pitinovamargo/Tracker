//
//  CategoryViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 14.08.2023.
//

import UIKit

final class CategoryViewController: UIViewController {

    let cellReuseIdentifier = "CategoryViewController"
    
    private let header: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Категория"
        header.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        header.textColor = .ypBlackDay
        return header
    }()
    
    private let emptyCategoryLogo: UIImageView = {
        let emptyTrackersLogo = UIImageView()
        emptyTrackersLogo.translatesAutoresizingMaskIntoConstraints = false
        emptyTrackersLogo.image = UIImage(named: "Empty trackers")
        return emptyTrackersLogo
    }()
    
    private let emptyCategoryText: UILabel = {
        let emptyTrackersText = UILabel()
        emptyTrackersText.translatesAutoresizingMaskIntoConstraints = false
        emptyTrackersText.text = "Привычки и события можно\nобъединить по смыслу"
        emptyTrackersText.textColor = .ypBlackDay
        emptyTrackersText.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        emptyTrackersText.numberOfLines = 2
        emptyTrackersText.textAlignment = .center
        
        return emptyTrackersText
    }()
    
    private lazy var addCategory: UIButton = {
        let habitButton = UIButton(type: .custom)
        habitButton.setTitle("Добавить категорию", for: .normal)
        habitButton.setTitleColor(.ypWhiteDay, for: .normal)
        habitButton.backgroundColor = .ypBlackDay
        habitButton.layer.cornerRadius = 16
        habitButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        habitButton.addTarget(self, action: #selector(addCategoryTapped), for: .touchUpInside)
        habitButton.translatesAutoresizingMaskIntoConstraints = false
        return habitButton
    }()
    
    private let categoriesTableView: UITableView = {
        let categoriesTableView = UITableView()
        categoriesTableView.translatesAutoresizingMaskIntoConstraints = false
        return categoriesTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .ypWhiteDay
        addSubviews()
        setupTrackersTableView()
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 26),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoriesTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 38),
            categoriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            categoriesTableView.heightAnchor.constraint(equalToConstant: 74),
            emptyCategoryLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyCategoryLogo.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 246),
            emptyCategoryLogo.heightAnchor.constraint(equalToConstant: 80),
            emptyCategoryLogo.widthAnchor.constraint(equalToConstant: 80),
            emptyCategoryText.centerXAnchor.constraint(equalTo: emptyCategoryLogo.centerXAnchor),
            emptyCategoryText.topAnchor.constraint(equalTo: emptyCategoryLogo.bottomAnchor, constant: 8),
            addCategory.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            addCategory.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addCategory.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addCategory.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func addSubviews() {
        view.addSubview(header)
        view.addSubview(emptyCategoryLogo)
        view.addSubview(emptyCategoryText)
        view.addSubview(addCategory)
        view.addSubview(categoriesTableView)
    }
    
    private func setupTrackersTableView() {
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.register(CategoryCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        categoriesTableView.layer.cornerRadius = 16
        categoriesTableView.separatorStyle = .none
    }
    
    @objc private func addCategoryTapped() {
        let сreateCategoryViewController = CreateCategoryViewController()
        present(сreateCategoryViewController, animated: true, completion: nil)
    }

}

// MARK: - UITableViewDelegate
extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0 {
//            let addCategoryViewController = CategoryViewController()
//            present(addCategoryViewController, animated: true, completion: nil)
//        } else if indexPath.row == 1 {
//            let scheduleViewController = ScheduleViewController()
//            scheduleViewController.createTrackerViewController = self
//            present(scheduleViewController, animated: true, completion: nil)
//        }
//        trackersTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let separatorInset: CGFloat = 16
        let separatorWidth = tableView.bounds.width - separatorInset * 2
        let separatorHeight: CGFloat = 1.0
        let separatorX = separatorInset
        let separatorY = cell.frame.height - separatorHeight
        let separatorView = UIView(frame: CGRect(x: separatorX, y: separatorY, width: separatorWidth, height: separatorHeight))
        separatorView.backgroundColor = .ypGray
        cell.addSubview(separatorView)
    }
}

// MARK: - UITableViewDataSource
extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? CategoryCell else { return UITableViewCell() }
        if indexPath.row == 0 {
            cell.update(with: "Важное")
        } else if indexPath.row == 1 {
            cell.update(with: "Расписание")
        }
        return cell
    }
}
