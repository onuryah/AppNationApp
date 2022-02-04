//
//  WebService.swift
//  AppNation
//
//  Created by Ceren Çapar on 3.02.2022.
//

import Foundation
import UIKit

class Webservice{
    
    static func fetchData<T : Decodable>(urlString : String, tableView: UITableView,model: T.Type ,compilation: @escaping(T) -> ()){
        guard let stornUrl = URL(string: urlString) else {return}
        var request = URLRequest(url: stornUrl)
        request.timeoutInterval = 300
        let session = URLSession(configuration: .default)
        session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if error != nil{
                    return
                }else if data != nil {
                    guard let data = data else {return}
                    do{
                            let data = try JSONDecoder().decode(model, from: data)
                        compilation(data)
                        tableView.reloadData()
                    }catch{}
            }
        }
    }
        .resume()
}
}
