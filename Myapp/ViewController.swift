//
//  ViewController.swift
//  Myapp
//
//  Created by 市田圭司 on 2022/05/07.
//

import UIKit
import Combine

class ViewController: UIViewController,UITableViewDataSource, UISearchBarDelegate{
    
    
    
    let Gitdata = ["ルフィ","ゾロ","サンジ","ウソップ","ナミ","チョッパー","ロビン","フランキー","ブルック","ジンベエ"]
    
    var filteredData:[String]!
    var test :String?
    
    @IBOutlet var mugiwaraTableView : UITableView!
    @IBOutlet var searchBar :UISearchBar!
    var SearchRepositoryResponse : [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        //リロードした際位にdataSourceを適用させる
        mugiwaraTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        searchBar.delegate = self
        
        filteredData = Gitdata
        //let url = URL(string: "https://api.github.com/search/repositories?q=Swift")
        
    }
    
    
    private let session = URLSession.shared
    private let baseUrl: String = "https://api.github.com"
//APIを使えるようにする
//    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let memberCell = mugiwaraTableView.dequeueReusableCell(withIdentifier: "Cell")!
        memberCell.textLabel?.text = filteredData[indexPath.row]
        
        
        return memberCell
        
        
        
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == ""{
            filteredData = Gitdata
        }else{
            for fruit in Gitdata{
                if fruit.lowercased().contains(searchText.lowercased()){
                    filteredData.append(fruit)
                }
            }
            
        }
        
        
        self.mugiwaraTableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toSub") {
            let reVC = segue.destination as! resultViewController
            
            let selectedIndex = mugiwaraTableView.indexPathForSelectedRow!
            
            reVC.outputValue = Gitdata[selectedIndex.row]
            
          //  subVC.postId = self.acounts as? String
    
            //ここで情報を絞ってsuVCにわたすコードを書く
        }
    }

}
