//
//  CreateTrackerViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 24.07.2023.
//

import UIKit

final class CreateTrackerViewController: UIViewController {
    
    let cellReuseIdentifier = "CreateTrackersTableViewCell"
    let clearButton = UIButton(type: .custom)
    let createButton: UIButton = UIButton(type: .custom)
    let header: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Новая привычка"
        header.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        header.textColor = .ypBlackDay
        return header
    }()
    let addTrackerName: UITextField = {
        let addTrackerName = UITextField()
        addTrackerName.translatesAutoresizingMaskIntoConstraints = false
        addTrackerName.placeholder = "Введите название трекера"
        addTrackerName.backgroundColor = .ypBackgroundDay
        addTrackerName.layer.cornerRadius = 16
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        addTrackerName.leftView = leftView
        addTrackerName.leftViewMode = .always
        addTrackerName.keyboardType = .default
        addTrackerName.returnKeyType = .done
        addTrackerName.becomeFirstResponder()
        return addTrackerName
    }()
    let trackersTableView: UITableView = {
        let trackersTableView = UITableView()
        trackersTableView.translatesAutoresizingMaskIntoConstraints = false
        return trackersTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .ypWhiteDay
        view.addSubview(header)
        view.addSubview(addTrackerName)
        view.addSubview(trackersTableView)
        
        let cancelButton = cancelButton()
        configureCreateButton()
        setupClearButton()

        addTrackerName.delegate = self
        trackersTableView.delegate = self
        trackersTableView.dataSource = self
        trackersTableView.register(CreateTrackerViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        trackersTableView.layer.cornerRadius = 16
        trackersTableView.separatorStyle = .none
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 26),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTrackerName.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 38),
            addTrackerName.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            addTrackerName.heightAnchor.constraint(equalToConstant: 75),
            addTrackerName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addTrackerName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            trackersTableView.topAnchor.constraint(equalTo: addTrackerName.bottomAnchor, constant: 24),
            trackersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            trackersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            trackersTableView.heightAnchor.constraint(equalToConstant: 149),
            cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width/2) - 4),
            cancelButton.heightAnchor.constraint(equalToConstant: 60),
            createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createButton.heightAnchor.constraint(equalToConstant: 60),
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.width/2) + 4)
        ])
    }
    
    func setupClearButton() {
        clearButton.setImage(UIImage(named: "cleanKeyboard"), for: .normal)
        clearButton.frame = CGRect(x: 0, y: 0, width: 17, height: 17)
        clearButton.contentMode = .scaleAspectFit
        clearButton.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
        clearButton.isHidden = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 29, height: 17))
        paddingView.addSubview(clearButton)
        addTrackerName.rightView = paddingView
        addTrackerName.rightViewMode = .whileEditing
    }
    func cancelButton() -> UIButton {
        let cancelButton = UIButton(type: .custom)
        view.addSubview(cancelButton)
        cancelButton.setTitleColor(.ypRed, for: .normal)
        cancelButton.layer.borderWidth = 1.0
        cancelButton.layer.borderColor = UIColor.ypRed.cgColor
        cancelButton.layer.cornerRadius = 16
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        cancelButton.setTitle("Отменить", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        return cancelButton
    }
    func configureCreateButton() {
        view.addSubview(createButton)
        createButton.setTitleColor(.ypWhiteDay, for: .normal)
        createButton.backgroundColor = .ypGray
        createButton.layer.cornerRadius = 16
        createButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        createButton.setTitle("Создать", for: .normal)
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.isEnabled = false
    }
    @objc func clearTextField() {
        addTrackerName.text = ""
        clearButton.isHidden = true
       }
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
    @objc private func createButtonTapped() {
    }
}


extension CreateTrackerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! CreateTrackerViewCell
        if indexPath.row == 0 {
            cell.titleLabel.text = "Категория"
        } else if indexPath.row == 1 {
            cell.titleLabel.text = "Расписание"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            present(ScheduleViewController(), animated: true, completion: nil)
        }
        trackersTableView.deselectRow(at: indexPath, animated: true)
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

extension CreateTrackerViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        clearButton.isHidden = textField.text?.isEmpty ?? true
        if textField.text?.isEmpty ?? false {
            createButton.isEnabled = false
            createButton.backgroundColor = .ypGray
        } else {
            createButton.isEnabled = true
            createButton.backgroundColor = .ypBlackDay
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
