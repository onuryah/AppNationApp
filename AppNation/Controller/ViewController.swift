//
//  ViewController.swift
//  AppNation
//
//  Created by Ceren Çapar on 3.02.2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var dataArray = [Child]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        fetchDatas()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        itemsInCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    fileprivate func setDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    fileprivate func fetchDatas(){
        let url = UrlClass.baseUrl+UrlClass.nameUrl+UrlClass.topUrl
        Webservice.fetchData(urlString: url, tableView: tableView, model: JSON.self) { datas in
            self.dataArray = datas.data.children
        }
    }
    
    fileprivate func itemsInCell(cell: Cell, indexPath: IndexPath){
        cell.titleLabelField.text = dataArray[indexPath.row].data.title
        cell.scoreLabelField.text = "Score: "+String(dataArray[indexPath.row].data.score)
        cell.authorLabelField.text = "Author: "+dataArray[indexPath.row].data.author
        cell.descriptionLabelField.text = dataArray[indexPath.row].data.selftext
        if dataArray[indexPath.row].data.selftext == ""{
            cell.descriptionLabelField.text = "Description is not found."
        }
        var urlString = dataArray[indexPath.row].data.thumbnail
        switch urlString{
        case "self": urlString = UrlClass.baseUrl+UrlClass.selfImageUrl
        case "default": urlString = UrlClass.baseUrl+UrlClass.defaultImageUrl
        case "nsfw": urlString = UrlClass.baseUrl+UrlClass.nsfwImageUrl
        default:
            urlString = dataArray[indexPath.row].data.thumbnail
        }
        let url = URL(string: urlString)
        cell.thumbnailImageView.sd_setImage(with: url)
    }
}

