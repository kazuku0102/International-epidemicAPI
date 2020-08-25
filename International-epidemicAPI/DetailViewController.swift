//
//  DetailViewController.swift
//  International-epidemicAPI
//
//  Created by 蕭聿莘 on 2020/8/24.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var describeLabel: UILabel!

    var epidemic: Epidemic!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = epidemic.headline
        describeLabel.text = epidemic.description
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
