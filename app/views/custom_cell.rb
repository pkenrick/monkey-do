class CustomCell < UITableViewCell

  def initWithStyle(cell_style, reuseIdentifier: reuse_identifier)
    super

    new_label = UILabel.alloc.initWithFrame(CGRectZero)
    new_label.text = "Another label!"
    new_label.frame = [[0,0],[50,50]]
    new_label.numberOfLines = 0
    new_label.sizeToFit
    new_label.backgroundColor = UIColor.yellowColor
    # title_label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin
    self.contentView.addSubview(new_label)

    # self.textLabel.frame = [[0,0],[70,70]]


    self
  end

end
