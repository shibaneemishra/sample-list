//
//  DetailsViewController.swift
//  Test123
//
//  Created by Shibanee Mishra on 06/09/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblBody : UILabel!

    var detailsValue:Response?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(detailsValue)
        
        lblTitle.text = detailsValue?.title
        lblBody.text = detailsValue?.body
        
    }


    @IBAction func btnBack(_ sender:UIButton ) {
        self.navigationController?.popViewController(animated: true)
    }
   

}

extension DetailsViewController {
    static func getInstance(details:Response) -> DetailsViewController {
        let controller = DetailsViewController()
        controller.detailsValue = details
        return controller
    }
}
