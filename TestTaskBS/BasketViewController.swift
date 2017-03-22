//
//  BasketViewController.swift
//  TestTaskBS
//
//  Created by Bogdan Kostyuchenko on 20.03.17.
//  Copyright © 2017 Bogdan Kostyuchenko. All rights reserved.
//

import UIKit

class BasketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    //MARK: - OUTLETS
    @IBOutlet weak var scrollVIew: UIScrollView!
    @IBOutlet weak var basketTableView: UITableView!
    @IBOutlet weak var enterEmailTextField: UITextField!
    
    
    
    
    
    //MARK: - Structures
    struct Menu {
        var sectionName: String!
        var contentSection: [String]?
    }
    
    let menuArray: [Menu] = [Menu(sectionName: "Контактная информация", contentSection: ["Телефон","Имя","E-mail"]),
                             Menu(sectionName: "Доставка и оплата", contentSection: ["Индекс","Адрес", "Ближайшее метро"]),
                             Menu(sectionName: "Специальные предложения", contentSection: nil),
                             Menu(sectionName: "Товаров", contentSection: nil),
                             Menu(sectionName: "Ячейка с кнопкой", contentSection: nil)]
    
    struct User {
        var name: String!
        var clotherName: [String]!
        var clotherImage: [String]!
    }
    
    let userArray: [User] = [User(name: "Иван", clotherName: ["Костюм спортивный мужской Black (Черный, M)", "Тапочки мужские Black"], clotherImage: ["Black_Star_Wear_logo", ""])]
    
    var selectedIndex = 0
    
    
    
    
    
    //MARK: - Life Cyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSettings()
        tableSettings()
        enterYourEmailTextField()
    }
    
    
    
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case menuArray.count-1:
            return 100
        default:
            if selectedIndex == indexPath.row {
                return 200
            } else {
                return 40
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellForSpecialOffer", for: indexPath) as! SpecialOfferTableViewCell
            
            cell.sectionNameLabel.text = menuArray[indexPath.row].sectionName
            cell.specialOfferLabel.text = "\(userArray[0].name!), при покупке “\(userArray[0].clotherName[0])” вы можете преобрести шапку со скидкой 5"
            
            return cell
            
        } else if indexPath.row == menuArray.count-1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellForOffer", for: indexPath) as! OfferTableViewCell
            
            return cell
        } else if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellForProduct", for: indexPath) as! ProductTableViewCell
            
            cell.sectionNameLabel.text = menuArray[indexPath.row].sectionName  + " (\(userArray[0].clotherName.count))"
            cell.someImage.image = UIImage(named: userArray[0].clotherImage[0])
            
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellForPersonalInformation", for: indexPath) as! PersonalInformationTableViewCell
            
            cell.sectionNameLabel.text = menuArray[indexPath.row].sectionName
            cell.firstTextField.placeholder = menuArray[indexPath.row].contentSection?[0]
            cell.secondTextField.placeholder = menuArray[indexPath.row].contentSection?[1]
            cell.thirdTextField.placeholder = menuArray[indexPath.row].contentSection?[2]
            if indexPath.row == 0 {
                cell.sectionImage.image = UIImage(cgImage: (cell.sectionImage.image!.cgImage!), scale: CGFloat(1.0), orientation: .right)
            }
            
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndex != indexPath.row && indexPath.row != menuArray.count-1 {
            selectedIndex = indexPath.row
            
            rotationToRight(indexPath: indexPath)
        }
        self.basketTableView.beginUpdates()
        self.basketTableView.endUpdates()
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if selectedIndex == indexPath.row && indexPath.row != menuArray.count-1 {
            selectedIndex = indexPath.row
            
            rotationToHomePlace(indexPath: indexPath)
        }
    }
    
    
    
    
    func rotationToRight(indexPath: IndexPath) {
        if indexPath.row == 0 || indexPath.row == 1{
            let cell = self.basketTableView.cellForRow(at: indexPath) as! PersonalInformationTableViewCell
            cell.sectionImage.image = UIImage(cgImage: (cell.sectionImage.image!.cgImage!), scale: CGFloat(1.0), orientation: .right)
            
        } else if indexPath.row == 2 {
            let cell = self.basketTableView.cellForRow(at: indexPath) as! SpecialOfferTableViewCell
            cell.sectionImage.image = UIImage(cgImage: (cell.sectionImage.image!.cgImage!), scale: CGFloat(1.0), orientation: .right)
        } else if indexPath.row == 3 {
            let cell = self.basketTableView.cellForRow(at: indexPath) as! ProductTableViewCell
            cell.sectionImage.image = UIImage(cgImage: (cell.sectionImage.image!.cgImage!), scale: CGFloat(1.0), orientation: .right)
        }
    }
    func rotationToHomePlace(indexPath: IndexPath) {
        if indexPath.row == 0 || indexPath.row == 1 {
            let cell = self.basketTableView.cellForRow(at: indexPath) as! PersonalInformationTableViewCell
            cell.sectionImage.image = UIImage(named: "checker")
        } else if indexPath.row == 2 {
            let cell = self.basketTableView.cellForRow(at: indexPath) as! SpecialOfferTableViewCell
            cell.sectionImage.image = UIImage(named: "checker")
        } else if indexPath.row == 3 {
            let cell = self.basketTableView.cellForRow(at: indexPath) as! ProductTableViewCell
            cell.sectionImage.image = UIImage(named: "checker")
        }
    }
    
    //MARK: - Settings
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func navigationBarSettings() {
        //Инициализируем навигационную панель через текущий navigationController нашего класса
        let navigationBar = self.navigationController?.navigationBar
        
        navigationBar?.tintColor = .white
        
        //Стиль навигационной панели
        navigationBar?.barTintColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 1.0)
        self.navigationController?.navigationBar.isTranslucent = false
        //Инициализация держателя изображения,
        //указывая его размеры, точку образрвания и обозначая стиль размещения изображения
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        imageView.contentMode = .scaleAspectFit
        
        //Cоздание самого изображение и размещение его в держателе
        let image = UIImage(named: "title")
        imageView.image = image
        
        //Мы обращаемся к свойству titleView объекта navigationItem, который имеет тип UIView?
        //и присваиваем ему изображение
        navigationItem.titleView = imageView
    }
    
    func tableSettings() {
        //Все разделители бесцветны
        self.basketTableView.separatorColor = .clear
    }
    
    func enterYourEmailTextField() {
        //
        self.enterEmailTextField.layer.borderWidth = 1
        self.enterEmailTextField.layer.borderColor = UIColor.black.cgColor
        self.enterEmailTextField.layer.masksToBounds = true
    }
}
