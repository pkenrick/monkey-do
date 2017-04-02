class CustomCell < UITableViewCell

  attr_accessor :textLabel, :imageView, :dueDate, :owner, :ownerLabel, :postIt

  def initWithStyle(style, reuseIdentifier: reuseIdentifier)
    super

    puts self.contentView.subviews
    @textLabel = UILabel.alloc.init
    # @imageView = UIImageView.alloc.init
    @imageView = UIButton.buttonWithType(UIButtonTypeCustom)
    @postIt = UIImageView.alloc.init
    @dueDate = UILabel.alloc.init
    @owner = UILabel.alloc.init
    @ownerLabel = UIButton.buttonWithType(UIButtonTypeCustom)
    self
  end

  def layoutSubviews
    super

    @imageView.frame = [[self.contentView.size.width / 30,10],[self.contentView.size.height / 2 - 20, self.contentView.size.height / 2 - 20]]
    self.contentView.addSubview(@imageView)

    @textLabel.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    self.contentView.addSubview(@textLabel)

    @textLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel_top = NSLayoutConstraint.constraintWithItem(@textLabel, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @imageView, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 0.0)
    titleLabel_left = NSLayoutConstraint.constraintWithItem(@textLabel, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @imageView, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: self.contentView.size.width / 30)
    titleLabel_height = NSLayoutConstraint.constraintWithItem(@textLabel, attribute: NSLayoutAttributeHeight, relatedBy: NSLayoutRelationEqual, toItem: @imageView, attribute: NSLayoutAttributeHeight, multiplier: 1.0, constant: 0.0)
    titleLabel_right = NSLayoutConstraint.constraintWithItem(@textLabel, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: self.contentView, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: -10.0)
    self.contentView.addConstraint(titleLabel_top)
    self.contentView.addConstraint(titleLabel_left)
    self.contentView.addConstraint(titleLabel_height)
    self.contentView.addConstraint(titleLabel_right)

    @separatorLine = UIView.alloc.init
    @separatorLine.backgroundColor = UIColor.lightGrayColor
    self.contentView.addSubview(@separatorLine)

    @separatorLine.translatesAutoresizingMaskIntoConstraints = false
    separatorLine_top = NSLayoutConstraint.constraintWithItem(@separatorLine, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: self.contentView, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: self.contentView.size.height / 2)
    separatorLine_left = NSLayoutConstraint.constraintWithItem(@separatorLine, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @textLabel, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 0.0)
    separatorLine_height = NSLayoutConstraint.constraintWithItem(@separatorLine, attribute: NSLayoutAttributeHeight, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 1.0)
    separatorLine_right = NSLayoutConstraint.constraintWithItem(@separatorLine, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: self.contentView, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: -10.0)
    self.contentView.addConstraint(separatorLine_top)
    self.contentView.addConstraint(separatorLine_left)
    self.contentView.addConstraint(separatorLine_height)
    self.contentView.addConstraint(separatorLine_right)

    @postIt.frame = [[self.contentView.size.width / 30,50],[self.contentView.size.height / 2 - 20, self.contentView.size.height / 2 - 20]]
    self.contentView.addSubview(@postIt)

    @postIt.translatesAutoresizingMaskIntoConstraints = false
    postIt_top = NSLayoutConstraint.constraintWithItem(@postIt, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @separatorLine, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 10.0)
    postIt_left = NSLayoutConstraint.constraintWithItem(@postIt, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @imageView, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 0.0)
    postIt_height = NSLayoutConstraint.constraintWithItem(@postIt, attribute: NSLayoutAttributeHeight, relatedBy: NSLayoutRelationEqual, toItem: @imageView, attribute: NSLayoutAttributeHeight, multiplier: 1.0, constant: 0.0)
    postIt_width = NSLayoutConstraint.constraintWithItem(@postIt, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: @imageView, attribute: NSLayoutAttributeWidth, multiplier: 1.0, constant: 0.0)
    self.contentView.addConstraint(postIt_top)
    self.contentView.addConstraint(postIt_left)
    self.contentView.addConstraint(postIt_height)
    self.contentView.addConstraint(postIt_width)

    @dueDate.font = UIFont.fontWithName("Arial", size: 15)
    @dueDate.textColor = UIColor.grayColor
    self.contentView.addSubview(@dueDate)

    @dueDate.translatesAutoresizingMaskIntoConstraints = false
    dueDate_top = NSLayoutConstraint.constraintWithItem(@dueDate, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @separatorLine, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 10.0)
    dueDate_left = NSLayoutConstraint.constraintWithItem(@dueDate, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @textLabel, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 0.0)
    dueDate_height = NSLayoutConstraint.constraintWithItem(@dueDate, attribute: NSLayoutAttributeHeight, relatedBy: NSLayoutRelationEqual, toItem: @imageView, attribute: NSLayoutAttributeHeight, multiplier: 1.0, constant: 0.0)
    dueDate_width = NSLayoutConstraint.constraintWithItem(@dueDate, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: @textLabel, attribute: NSLayoutAttributeWidth, multiplier: 0.5, constant: -5.0)
    self.contentView.addConstraint(dueDate_top)
    self.contentView.addConstraint(dueDate_left)
    self.contentView.addConstraint(dueDate_height)
    self.contentView.addConstraint(dueDate_width)

    @owner.font = UIFont.fontWithName("Arial", size: 15)
    @owner.textColor = UIColor.grayColor
    self.contentView.addSubview(@owner)

    @owner.translatesAutoresizingMaskIntoConstraints = false
    owner_top = NSLayoutConstraint.constraintWithItem(@owner, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @separatorLine, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 10.0)
    owner_left = NSLayoutConstraint.constraintWithItem(@owner, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @dueDate, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 10.0)
    owner_height = NSLayoutConstraint.constraintWithItem(@owner, attribute: NSLayoutAttributeHeight, relatedBy: NSLayoutRelationEqual, toItem: @imageView, attribute: NSLayoutAttributeHeight, multiplier: 1.0, constant: 0.0)
    # owner_width = NSLayoutConstraint.constraintWithItem(@owner, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: @textLabel, attribute: NSLayoutAttributeWidth, multiplier: 0.5, constant: -5.0)
    self.contentView.addConstraint(owner_top)
    self.contentView.addConstraint(owner_left)
    self.contentView.addConstraint(owner_height)
    # self.contentView.addConstraint(owner_width)

    self.contentView.addSubview(@ownerLabel)

    @ownerLabel.translatesAutoresizingMaskIntoConstraints = false
    ownerLabel_top = NSLayoutConstraint.constraintWithItem(@ownerLabel, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @owner, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 5.0)
    ownerLabel_left = NSLayoutConstraint.constraintWithItem(@ownerLabel, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @owner, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 5.0)
    ownerLabel_height = NSLayoutConstraint.constraintWithItem(@ownerLabel, attribute: NSLayoutAttributeHeight, relatedBy: NSLayoutRelationEqual, toItem: @owner, attribute: NSLayoutAttributeHeight, multiplier: 0.75, constant: 0.0)
    ownerLabel_width = NSLayoutConstraint.constraintWithItem(@ownerLabel, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 75.0)
    self.contentView.addConstraint(ownerLabel_top)
    self.contentView.addConstraint(ownerLabel_left)
    self.contentView.addConstraint(ownerLabel_height)
    self.contentView.addConstraint(ownerLabel_width)

  end

  def viewDidLoad
    super
    self
  end

  def viewDidAppear
    super
    puts "in the viewDidAppear method"
    self
  end

end
