//
//  PlanetDetailVC.swift
//  StarWars
//
//  Created by Ratul Chhibber on 16/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import UIKit

class PlanetDetailVC: UIViewController {
    
    private var viewModel: PlanetDetailVM?
    
    func configure(with viewModel: PlanetDetailVM) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Planet Details"
    }
}

extension PlanetDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterDetail",
                                                 for: indexPath)
        if let type = viewModel?.rowDetails(for: indexPath) {
            cell.textLabel?.text = type.description
            cell.detailTextLabel?.text = type.value
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rowCount() ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sectionCount ?? 0
    }
}
