//
//  IrregularEventViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 25.07.2023.
//

import UIKit

final class IrregularEventViewController: UIViewController {

    let irregularEventCellReuseIdentifier = "IrregularEventTableViewCell"
    let clearButton = UIButton(type: .custom)

    let header: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Новое нерегулярное событие"
        header.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        header.textColor = .ypBlackDay
        return header
    }()
    
    let addEventName: UITextField = {
        let addTrackerName = UITextField()
        addTrackerName.translatesAutoresizingMaskIntoConstraints = false
        addTrackerName.placeholder = "Введите название трекера"
        addTrackerName.backgroundColor = .ypBackgroundDay
        addTrackerName.layer.cornerRadius = 16
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        addTrackerName.leftView = leftView
        addTrackerName.leftViewMode = .always
        addTrackerName.returnKeyType = .done
        addTrackerName.keyboardType = .default
        addTrackerName.becomeFirstResponder()
        return addTrackerName
    }()
    
    let irregularEventTableView: UITableView = {
        let trackersTableView = UITableView()
        trackersTableView.translatesAutoresizingMaskIntoConstraints = false
        return trackersTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .ypWhiteDay
                
        view.addSubview(header)
        view.addSubview(addEventName)
        view.addSubview(irregularEventTableView)
        
        let cancelButton = cancelButton()
        let createButton = createButton()
        setupClearButton()
        
        addEventName.delegate = self
        irregularEventTableView.delegate = self
        irregularEventTableView.dataSource = self
        irregularEventTableView.register(IrregularEventCell.self, forCellReuseIdentifier: irregularEventCellReuseIdentifier)
        irregularEventTableView.layer.cornerRadius = 16
        irregularEventTableView.separatorStyle = .none
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 26),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addEventName.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 38),
            addEventName.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            addEventName.heightAnchor.constraint(equalToConstant: 75),
            addEventName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addEventName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            irregularEventTableView.topAnchor.constraint(equalTo: addEventName.bottomAnchor, constant: 24),
            irregularEventTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            irregularEventTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            irregularEventTableView.heightAnchor.constraint(equalToConstant: 75),
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
        addEventName.rightView = paddingView
        addEventName.rightViewMode = .whileEditing
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
    
    func createButton() -> UIButton {
        let createButton = UIButton(type: .custom)
        view.addSubview(createButton)
        createButton.setTitleColor(.ypWhiteDay, for: .normal)
        createButton.backgroundColor = .ypGray
        createButton.layer.cornerRadius = 16
        createButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        createButton.setTitle("Создать", for: .normal)
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        return createButton
    }
    
    @objc func clearTextField() {
        addEventName.text = ""
       }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func createButtonTapped() {
        
    }
}

extension IrregularEventViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: irregularEventCellReuseIdentifier, for: indexPath) as! IrregularEventCell
        
            cell.titleLabel.text = "Категория"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        irregularEventTableView.deselectRow(at: indexPath, animated: true)
    }
}

extension IrregularEventViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        clearButton.isHidden = textField.text?.isEmpty ?? true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
