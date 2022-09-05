//
//  ListViewModel.swift
//  Test123
//
//  Created by Shibanee Mishra on 05/09/22.
//

import Foundation


class ListViewModel {
    
    var list:[Response] = [Response]()
    typealias isTableLoad = (Bool?) -> Void
    let repo:ListRepository?
    
    init (repo:ListRepository){
        self.repo = repo
    }
    
    func getData( complition: @escaping((_ istableLoad:Bool) -> Void) ) {
        
        
        repo?.fetchList{ [weak self ] response in
            self?.list = response ?? [Response]()
            complition(true)

        } _: { _ in
            complition(false)

        }

//        guard var urlComponent = URLComponents(string:apiUrl ) else {
//            fatalError("Unable to create url component")
//        }
//        var urlRequest =
//        URLRequest(url: urlComponent.url!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.00)
//        urlRequest.httpMethod = HTTPMethod.GET.rawValue
//        urlRequest.httpBody = nil
//        print(urlRequest.url ?? "")
//        urlRequest.allHTTPHeaderFields = HTTPHeader().getHeaders
//
//        let request = urlRequest
//        let dataTask = URLSession.shared.dataTask(with: request){
//            data,response,error in
//            print("anything")
//            do {
//                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSArray {
//                    print(jsonResult)
//                    let jsonResponse = try JSONDecoder().decode([Response].self, from: data ?? Data())
//                    self.list = jsonResponse
//                    complition(true)
//
//                }
//            } catch let error as NSError {
//                print(error.localizedDescription)
//                complition(false)
//
//            }
//        }
//        dataTask.resume()
}
    
    
   
}
