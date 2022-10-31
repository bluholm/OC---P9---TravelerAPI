//
//  TableCurrencyViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-10-28.
//

import UIKit

class TableCurrencyViewController: UITableViewController {

    private let currencyUrl = "https://api.apilayer.com/fixer/symbols"
    private let apiKey = "RsMNr3axWpCqqqI2viaMbRnLmayHmFEd"
    
    var currencies = [Currency]()

    let mytableView = UITableView()
    
    // - MARK: Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrency()
        
        navigationItem.title = "Choose Currency"
        
        setupStyle()
        setupSubView()
        setupLayout()
    }
    
    // -MARK: Custom Functions
    private func setupStyle() {
        //Update Colors, font , radius
        
    }
    
    private func setupSubView() {
        mytableView.delegate = self
        mytableView.dataSource = self
        mytableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        view.addSubview(mytableView)
    }
    
    private func setupLayout() {
        mytableView.translatesAutoresizingMaskIntoConstraints = false
        mytableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mytableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mytableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mytableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // - MARK: Json Parsing and APIRest
    private var task:URLSessionDataTask?
    
    private func getCurrency() {
        guard let url = URL(string: currencyUrl) else { return }
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "apikey")
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            print(response)
            print(String(data: data, encoding: .utf8)!)
            guard let responseJSON = try? JSONDecoder().decode(Currency.self, from: data),
                  let name = responseJSON["symbols"] else {
                    print("error not decod")
                    return
            }
            debugPrint("decode ok affiche name \(name)")
        }
        task?.resume()
    }

    // - MARK: Delegate and DataSource UITableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        //cell.textLabel?.text = currencies[indexPath.row]
        return cell
    }
}
