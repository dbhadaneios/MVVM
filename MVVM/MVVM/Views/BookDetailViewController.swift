//
//  BookDetailViewController.swift
//  MVVM
//
//  Created by Dinesh R Bhaddane on 27/12/2022.
//

import UIKit

final class BookDetailViewController: UIViewController {
    /// Private outlets
    @IBOutlet private weak var backGroundImageView: UIImageView!
    @IBOutlet private weak var bookImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var publishedDateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    /// view model object
    var dataViewModel: BooksDataViewModel?

    /// ViewController life cycle- Called after the view has been loaded.
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    /// update ui based on selected book
    private func updateUI() {
        bookImageView.setRoundCornerImage()
        self.backGroundImageView.image = UIImage(named: ImageConstants.backGroundImage.rawValue)
        guard let viewModel = dataViewModel else {
            return
        }
        self.title = viewModel.title
        self.nameLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.subtitle
        self.authorLabel.text = viewModel.author
        viewModel.delegate = self
        viewModel.showImage()
    }
}

// MARK: BooksDataViewModel Delegate method
extension BookDetailViewController: BooksDataViewModelDelegate {
    func didImageDownload(data: Data?, error: String?) {
        guard let data = data, let image = UIImage(data: data) else {
            return
        }
        DispatchQueue.main.async {
            self.bookImageView.image = image
        }
    }
}
