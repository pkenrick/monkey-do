class TodoListController < UIViewController

  attr_accessor :data, :table, :defaults, :background_image_view, :monkey_boy, :monkey_girl, :title_label, :subtitle_label

  def initWithNibName(name, bundle: bundle)
    super

    self.title = "My List"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("My List", image: UIImage.imageNamed("monkeyIcon.png"), tag: 1)
    self.navigationItem.title = "Monkey-Do!"

    UIGraphicsBeginImageContext(self.view.frame.size)
    image = UIImage.imageNamed("blue_pink_clear.jpg").drawInRect(self.view.bounds)
    newImage = UIImage.UIGraphicsGetImageFromCurrentImageContext
    UIImage.UIGraphicsEndImageContext
    self.view.backgroundColor = UIColor.colorWithPatternImage(newImage)

    # @monkey_boy = UIImageView.alloc.initWithImage(UIImage.imageNamed("MonkeyBoy.png"))
    # @monkey_boy.frame = CGRect.new([self.view.frame.size.width / 2 - self.view.frame.size.width / 3, self.view.frame.size.height / 2 - self.view.frame.size.width / 3],[self.view.frame.size.width / 3 , self.view.frame.size.width / 3])
    # @monkey_boy.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin
    # @monkey_boy.alpha = 0.2
    # @monkey_girl = UIImageView.alloc.initWithImage(UIImage.imageNamed("MonkeyGirl.png"))
    # @monkey_girl.frame = CGRect.new([@monkey_boy.frame.origin.x + @monkey_boy.frame.size.width, @monkey_boy.frame.origin.y],[@monkey_boy.frame.size.width , @monkey_boy.frame.size.height])
    # @monkey_girl.alpha = 0.2
    # @monkey_girl.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin
    # self.view.addSubview(@monkey_boy)
    # self.view.addSubview(@monkey_girl)

    self
  end

  def viewDidLoad
    super

    @table = UITableView.alloc.init
    @table.backgroundColor = UIColor.clearColor
    @table.backgroundView = background_image_view
    @table.setSeparatorStyle(UITableViewCellSeparatorStyleNone)
    @table.rowHeight = 120
    self.view.addSubview(@table)

    @table.translatesAutoresizingMaskIntoConstraints = false
    table_top = NSLayoutConstraint.constraintWithItem(@table, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: self.view, attribute: NSLayoutAttributeTopMargin, multiplier: 1.0, constant: 0.0)
    table_left = NSLayoutConstraint.constraintWithItem(@table, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: self.view, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 0.0)
    table_right = NSLayoutConstraint.constraintWithItem(@table, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: self.view, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 0.0)
    table_bottom = NSLayoutConstraint.constraintWithItem(@table, attribute: NSLayoutAttributeBottom, relatedBy: NSLayoutRelationEqual, toItem: self.view, attribute: NSLayoutAttributeBottomMargin, multiplier: 1.0, constant: 0.0)
    self.view.addConstraint(table_top)
    self.view.addConstraint(table_left)
    self.view.addConstraint(table_right)
    self.view.addConstraint(table_bottom)

    header_view = UIView.alloc.init
    @table.tableHeaderView = header_view

    @title_label = UILabel.alloc.init
    title_label.font = UIFont.fontWithName("AmericanTypewriter", size: 40)
    title_label.text = "Shared List"
    header_view.addSubview(title_label)

    title_label.translatesAutoresizingMaskIntoConstraints = false
    title_label_top = NSLayoutConstraint.constraintWithItem(title_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: header_view, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 0.0)
    title_label_left = NSLayoutConstraint.constraintWithItem(title_label, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: header_view, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 5.0)
    title_label_width = NSLayoutConstraint.constraintWithItem(title_label, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: header_view, attribute: NSLayoutAttributeWidth, multiplier: 1.0, constant: -10.0)
    header_view.addConstraint(title_label_top)
    header_view.addConstraint(title_label_left)
    header_view.addConstraint(title_label_width)

    @subtitle_label = UILabel.alloc.init
    @subtitle_label.font = UIFont.fontWithName("Arial-ItalicMT", size: 20)
    @subtitle_label.lineBreakMode = NSLineBreakByWordWrapping;
    @subtitle_label.numberOfLines = 0
    @subtitle_label.text = "This list is also accessible by your partner"
    header_view.addSubview(@subtitle_label)

    subtitle_label.translatesAutoresizingMaskIntoConstraints = false
    subtitle_label_top = NSLayoutConstraint.constraintWithItem(subtitle_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: title_label, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 5.0)
    subtitle_label_left = NSLayoutConstraint.constraintWithItem(subtitle_label, attribute: NSLayoutAttributeLeftMargin, relatedBy: NSLayoutRelationEqual, toItem: title_label, attribute: NSLayoutAttributeLeftMargin, multiplier: 1.0, constant: 0.0)
    subtitle_label_width = NSLayoutConstraint.constraintWithItem(subtitle_label, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: title_label, attribute: NSLayoutAttributeWidth, multiplier: 1.0, constant: 0.0)
    header_view.addConstraint(subtitle_label_top)
    header_view.addConstraint(subtitle_label_left)
    header_view.addConstraint(subtitle_label_width)

    # inset = UIEdgeInsetsMake(5, 0, 0, 0)
    # @table.contentInset = inset

    add_task_button = UIBarButtonItem.alloc.initWithTitle("Add Task", style: UIBarButtonItemStyleBordered, target: self, action: "add_task")
    self.navigationItem.rightBarButtonItem = add_task_button

    @table.dataSource = self
    @table.delegate = self

    @data = Task.load_tasks

  end

  def viewDidLayoutSubviews
    super
    header_view = self.table.tableHeaderView
    title_label.setPreferredMaxLayoutWidth(header_view.bounds.size.width - 10)
    subtitle_label.setPreferredMaxLayoutWidth(header_view.bounds.size.width - 10)
    updated_header_view_height = title_label.intrinsicContentSize.height + 5 + subtitle_label.intrinsicContentSize.height
    # tableHeaderView size cannot be set with constraints; the frame must be set explicitally.  Preferably considering the height of its subviews.
    header_view.frame = [header_view.frame.origin,[0,updated_header_view_height]]
    table.tableHeaderView = header_view
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier)
    cell ||= UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: reuseIdentifier)

    # cell ||= CustomCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: reuseIdentifier)

    cell.textLabel.text = @data[indexPath.row].title
    cell.textLabel.font = UIFont.fontWithName("AmericanTypewriter", size: 15)
    cell.textLabel.textColor = UIColor.blackColor
    cell.detailTextLabel.text = @data[indexPath.row].due_date
    cell.imageView.image = UIImage.imageNamed("monkeyIcon.png")
    cell.backgroundColor = UIColor.clearColor
    cell_background_view = UIImageView.alloc.initWithImage(cellBackgroundForRowAtIndexPath(indexPath))
    cell.backgroundView = cell_background_view
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    task = @data[indexPath.row]

    show_task_controller = ShowTaskController.alloc.initWithTask(task)
    show_task_controller.parent_controller = self
    self.navigationController.pushViewController(show_task_controller, animated: true)
  end

  def cellBackgroundForRowAtIndexPath(indexPath)
    if indexPath.row == 0
      UIImage.imageNamed("white_cell_top.png")
    elsif indexPath.row == @data.length - 1
      UIImage.imageNamed("white_cell_bottom.png")
    else
      UIImage.imageNamed("white_cell_middle.png")
    end
  end

  editingStyle = UITableViewCellEditingStyleDelete
  def tableView(tableView, commitEditingStyle: editingStyle, forRowAtIndexPath: indexPath)
    @data.delete_at(indexPath.row)
    Task.save_tasks(@data)
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimationFade)
  end

  def add_task
    add_task_controller = AddTaskController.alloc.initWithNibName(nil, bundle: nil)
    add_task_controller.parent_controller = self
    self.presentViewController(UINavigationController.alloc.initWithRootViewController(add_task_controller), animated: true, completion: lambda {})
  end




end
