//
//  ViewController.swift
//  Session
//
//  Created by Vinh The on 4/4/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import UIKit

typealias JSONDictionary = [String:Any]


class ViewController: UIViewController {
    var informations = [Location]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //postbyUploadTask()
        getNear()
    }
    
    
    func getNear() {
        
        postbyUploadTask{(dataResult) in
            self.informations.append(Location(info: dataResult))

            DispatchQueue.main.async {
                //print(self.informations[0].id)
            }
        }
    }
    
    
    func postbyUploadTask(completion: @escaping (_ any: JSONDictionary) -> Void){
        let configuration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: configuration)
        
        let dict : JSONDictionary = ["lat":"21.014825",
                                     "long":"105.846336",
                                     "type": "coffee",
                                     "r": "2000"]
        var body = ""
        
        for (key, value) in dict{
            
            let value = value as! String
    
            body = body.appending(key)
            body = body.appending("=")
            body = body.appending(value.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)
            body = body.appending("&")
        }
        
        let url = URL(string: "http://localhost:3000/find/near")
        
        let data = body.data(using: .utf8)
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = data
        urlRequest.addValue("application/x-www-form-urlencoded",
                            forHTTPHeaderField: "Content-Type")
        
        session.uploadTask(with: urlRequest, from: data) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
            }else if let responseHTTP = response as? HTTPURLResponse, responseHTTP.statusCode == 200{
                guard let result = data else { return }
                do{
                    let array = try JSONSerialization.jsonObject(with: result, options: []) as? [JSONDictionary]
                    
                    guard let resultArray = array else {print("result nil"); return}
                    
                    for dictJSON in resultArray {
                        //self.informations.append(Location(info: dictJSON))
                        completion(dictJSON)
                    }

                }catch let error as NSError{
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    @IBAction func act_Find(_ sender: UIButton) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailtablevc") as! DetailTableVC
        detailVC.informations = informations
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

