class TodoListController < UIViewController

  attr_accessor :list, :type, :table, :defaults, :background_image_view, :monkey_boy, :monkey_girl, :title_label, :subtitle_label

  def initWithType(type)
    self.initWithNibName(nil, bundle: nil)

    @type = type

    # self.title = "My List"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("#{type.capitalize} List", image: UIImage.imageNamed("monkeyIcon.png"), tag: 1)
    self.navigationItem.title = "#{type.capitalize} List"

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
    title_label.text = "#{@type.capitalize} List"
    header_view.addSubview(title_label)

    title_label.translatesAutoresizingMaskIntoConstraints = false
    title_label_top = NSLayoutConstraint.constraintWithItem(title_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: header_view, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 0.0)
    title_label_left = NSLayoutConstraint.constraintWithItem(title_label, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: header_view, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 5.0)
    title_label_width = NSLayoutConstraint.constraintWithItem(title_label, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: header_view, attribute: NSLayoutAttributeWidth, multiplier: 1.0, constant: -10.0)
    header_view.addConstraint(title_label_top)
    header_view.addConstraint(title_label_left)
    header_view.addConstraint(title_label_width)

    if @type == 'shared'
      sync_button = UIButton.buttonWithType(UIButtonTypeCustom)
      # sync_button.backgroundColor = UIColor.blueColor
      sync_button.setBackgroundImage(UIImage.imageNamed("sync_button.png"), forState: UIControlStateNormal)
      header_view.addSubview(sync_button)

      sync_button.translatesAutoresizingMaskIntoConstraints = false
      sync_button_top = NSLayoutConstraint.constraintWithItem(sync_button, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: header_view, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 5.0)
      sync_button_right = NSLayoutConstraint.constraintWithItem(sync_button, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: header_view, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 0.0)
      sync_button_height = NSLayoutConstraint.constraintWithItem(sync_button, attribute: NSLayoutAttributeHeight, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 40.0)
      sync_button_width = NSLayoutConstraint.constraintWithItem(sync_button, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 60.0)
      # sync_button.frame = [[sync_button.frame.origin.x, sync_button.frame.origin.y],[60, 40]]
      # sync_button_right = NSLayoutConstraint.constraintWithItem(sync_button, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: header_view, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 0.0)
      header_view.addConstraint(sync_button_top)
      header_view.addConstraint(sync_button_right)
      header_view.addConstraint(sync_button_height)
      header_view.addConstraint(sync_button_width)
      sync_button
      # @monkey_boy = UIImageView.alloc.initWithImage(UIImage.imageNamed("MonkeyBoy.png"))

    end

    @subtitle_label = UILabel.alloc.init
    @subtitle_label.font = UIFont.fontWithName("Arial-ItalicMT", size: 20)
    @subtitle_label.lineBreakMode = NSLineBreakByWordWrapping;
    @subtitle_label.numberOfLines = 0
    @subtitle_label.text = (@type == 'private') ? "This is is accessible only by you" : "This list is also accessible by your partner"
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

    @list = Task.load_tasks(@type)

  end

  def viewDidLayoutSubviews
    super
    header_view = self.table.tableHeaderView
    title_label.setPreferredMaxLayoutWidth(header_view.bounds.size.width - 10)
    subtitle_label.setPreferredMaxLayoutWidth(header_view.bounds.size.width - 10)
    updated_header_view_height = title_label.intrinsicContentSize.height + 5 + subtitle_label.intrinsicContentSize.height + 5
    # tableHeaderView size cannot be set with constraints; the frame must be set explicitally.  Preferably considering the height of its subviews.
    header_view.frame = [header_view.frame.origin,[0,updated_header_view_height]]
    table.tableHeaderView = header_view
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @list.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier)
    # cell ||= UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: reuseIdentifier)
    cell ||= CustomCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: reuseIdentifier)

    cell.textLabel.text = @list[indexPath.row].title
    # cell.imageView.image = UIImage.imageNamed("Checkbox-complete.png")
    if @list[indexPath.row].completed == false
      cell.imageView.setBackgroundImage(UIImage.imageNamed("Checkbox-incomplete.png"), forState: UIControlStateNormal)
    else
      cell.imageView.setBackgroundImage(UIImage.imageNamed("Checkbox-complete.png"), forState: UIControlStateNormal)
    end
    cell.imageView.tag = indexPath.row
    cell.imageView.addTarget(self, action: "toggle_complete_task:", forControlEvents: UIControlEventTouchUpInside)
    cell.dueDate.text = "Due: #{@list[indexPath.row].due_date}"
    cell.owner.text = "Owner:"
    cell.owner.sizeToFit
    if @list[indexPath.row].owner == "Me"
      cell.ownerLabel.setBackgroundImage(UIImage.imageNamed("me_label.png"), forState: UIControlStateNormal)
    else
      cell.ownerLabel.setBackgroundImage(UIImage.imageNamed("partner_label.png"), forState: UIControlStateNormal)
    end
    cell.ownerLabel.tag = indexPath.row
    cell.ownerLabel.addTarget(self, action: "toggle_owner_task:", forControlEvents: UIControlEventTouchUpInside)

    cell.backgroundColor = UIColor.clearColor
    cell_background_view = UIImageView.alloc.initWithImage(cellBackgroundForRowAtIndexPath(indexPath))

    cell.postIt.image = UIImage.imageNamed("post_it_no_background.png")

    cell.backgroundView = cell_background_view
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    task = @list[indexPath.row]

    show_task_controller = ShowTaskController.alloc.initWithTask(task)
    show_task_controller.parent_controller = self
    self.navigationController.pushViewController(show_task_controller, animated: true)
  end

  def cellBackgroundForRowAtIndexPath(indexPath)
    if indexPath.row == 0
      UIImage.imageNamed("white_cell_middle.png")
    elsif indexPath.row == @list.length - 1
      UIImage.imageNamed("white_cell_middle.png")
    else
      UIImage.imageNamed("white_cell_middle.png")
    end
  end

  editingStyle = UITableViewCellEditingStyleDelete
  def tableView(tableView, commitEditingStyle: editingStyle, forRowAtIndexPath: indexPath)
    @list.delete_at(indexPath.row)
    Task.save_tasks(@type, @list)
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimationFade)
  end

  def add_task
    add_task_controller = AddTaskController.alloc.initWithNibName(nil, bundle: nil)
    add_task_controller.parent_controller = self
    self.presentViewController(UINavigationController.alloc.initWithRootViewController(add_task_controller), animated: true, completion: lambda {})
  end

  def toggle_complete_task(sender)
    task = @list[sender.tag]
    if task.completed == false
      task.completed = true
    else
      task.completed = false
    end
    Task.save_tasks(type, list)
    table.reloadData
  end

  def toggle_owner_task(sender)
    task = @list[sender.tag]
    if task.owner == "Me"
      task.owner = "Partner"
    else
      task.owner = "Me"
    end
    Task.save_tasks(type, list)
    table.reloadData
  end



end
