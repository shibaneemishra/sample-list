//
//  ListRepository.swift
//  Test123
//
//  Created by Shibanee Mishra on 05/09/22.
//

import Foundation


enum HTTPMethod: String{
    case GET
}
struct HTTPHeader{
    var getHeaders = ["Content-Type":"application/json"]
}

protocol ProtocolAllListFromAPI {
    
    typealias StringResponse = (String?) -> Void

    func fetchList( _ onResponse : @escaping (([Response]?) -> Void), _ onFailure : @escaping StringResponse)
}

class ListRepository:ProtocolAllListFromAPI {
    
    let url = "https://jsonplaceholder.typicode.com/posts"
    
    
    // fetchVehicleDetails from server
    
    func fetchList( _ onResponse : @escaping (([Response]?) -> Void), _ onFailure : @escaping StringResponse){
        
        guard var urlComponent = URLComponents(string:url ) else {
            fatalError("Unable to create url component")
        }
        var urlRequest =
        URLRequest(url: urlComponent.url!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.00)
        urlRequest.httpMethod = HTTPMethod.GET.rawValue
        urlRequest.httpBody = nil
        print(urlRequest.url ?? "")
        urlRequest.allHTTPHeaderFields = HTTPHeader().getHeaders
        
        let request = urlRequest
        let dataTask = URLSession.shared.dataTask(with: request){
            data,response,error in
            print("anything")
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSArray {
                    print(jsonResult)
                    let jsonResponse = try JSONDecoder().decode([Response].self, from: data ?? Data())
                    // self.list = jsonResponse
                    onResponse(jsonResponse)
                    
                }
            } catch let error as NSError {
                print(error.localizedDescription)
                
            }
        }
        dataTask.resume()
    }
    
}
