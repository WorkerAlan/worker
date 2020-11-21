////
////  bTableView.swift
////  Alex
////
////  Created by Alan on 2020/11/21.
////
//
// import UIKit
//
// class BaseTableView: UIView {
//    lazy var tableView: UITableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain).then {
//        $0.separatorStyle = .none
//        $0.delegate = self
//        $0.dataSource = self
//        $0.tableFooterView = UIView()
//    }
//
//    lazy var datas: [Any] = [Any]()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    init() {
//        super.init(frame: CGRect.zero)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func update(data: [Any]) {
//
//    }
// }
//
// extension BaseTableView: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//
//
// }
//
//
