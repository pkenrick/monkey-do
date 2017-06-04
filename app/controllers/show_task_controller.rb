class ShowTaskController < UIViewController

  attr_accessor :parent_controller, :task

  def initWithTask(task)
    self.initWithNibName(nil, bundle: nil)
    @task = task
    self
  end

  def viewDidLoad
    super

    self.title = "Task Details"
    @nav_bar_height = self.navigationController.navigationBar.frame.size.height + 20
    @tab_bar_height = self.tabBarController.tabBar.frame.size.height

    self.view.backgroundColor = UIColor.whiteColor
    background_image_view = UIImageView.alloc.initWithFrame(self.view.bounds)
    background_image_view.setImage(UIImage.imageNamed("blue_pink_clear.jpg"))
    background_image_view.alpha = 1.0
    self.view.addSubview(background_image_view)

    @content_view = UIView.alloc.initWithFrame(self.view.bounds)
    @scroll_view = UIScrollView.alloc.initWithFrame(self.view.bounds)
    @scroll_view.setContentSize([self.view.size.width, self.view.size.height])
    @scroll_view.addSubview(@content_view)
    self.view.addSubview(@scroll_view)
    # self.view.addSubview(@content_view)

    edit_task_button = UIBarButtonItem.alloc.initWithTitle("Edit", style: UIBarButtonItemStyleBordered, target: self, action: "edit_task")
    self.navigationItem.rightBarButtonItem = edit_task_button

    # Task title

    title_label = UILabel.alloc.init
    title_label.text = "Title"
    title_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    title_label.sizeToFit
    @content_view.addSubview(title_label)

    title_label.translatesAutoresizingMaskIntoConstraints = false
    title_label_top = NSLayoutConstraint.constraintWithItem(title_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @content_view, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: @nav_bar_height + 30.0)
    title_label_right = NSLayoutConstraint.constraintWithItem(title_label, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: @content_view, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: self.view.size.width / 4)
    @content_view.addConstraint(title_label_top)
    @content_view.addConstraint(title_label_right)

    @title = UILabel.alloc.init
    @title.text = @task.title
    # @title.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    # @title.font = UIFont.fontWithName("Arial-ItalicMT", size: 20)
    @title.lineBreakMode = NSLineBreakByWordWrapping;
    @title.numberOfLines = 0
    @content_view.addSubview(@title)

    @title.translatesAutoresizingMaskIntoConstraints = false
    title_top = NSLayoutConstraint.constraintWithItem(@title, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: title_label, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 0.0)
    title_left = NSLayoutConstraint.constraintWithItem(@title, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: title_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 20.0)
    title_right = NSLayoutConstraint.constraintWithItem(@title, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: @content_view, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: -10.0)
    @content_view.addConstraint(title_top)
    @content_view.addConstraint(title_left)
    @content_view.addConstraint(title_right)

    # Task due date

    due_date_label = UILabel.alloc.init
    due_date_label.text = "Due date"
    due_date_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    due_date_label.sizeToFit
    @content_view.addSubview(due_date_label)

    due_date_label.translatesAutoresizingMaskIntoConstraints = false
    due_date_label_top = NSLayoutConstraint.constraintWithItem(due_date_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @title, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 20.0)
    due_date_label_right = NSLayoutConstraint.constraintWithItem(due_date_label, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: title_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 0.0)
    @content_view.addConstraint(due_date_label_top)
    @content_view.addConstraint(due_date_label_right)

    @due_date = UILabel.alloc.init
    @due_date.text = @task.due_date
    # @due_date.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    # @due_date.font = UIFont.fontWithName("Arial-ItalicMT", size: 20)
    @due_date.lineBreakMode = NSLineBreakByWordWrapping;
    @due_date.numberOfLines = 0
    @content_view.addSubview(@due_date)

    @due_date.translatesAutoresizingMaskIntoConstraints = false
    due_date_top = NSLayoutConstraint.constraintWithItem(@due_date, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: due_date_label, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 0.0)
    due_date_left = NSLayoutConstraint.constraintWithItem(@due_date, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: due_date_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 20.0)
    due_date_right = NSLayoutConstraint.constraintWithItem(@due_date, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: @content_view, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: -10.0)
    @content_view.addConstraint(due_date_top)
    @content_view.addConstraint(due_date_left)
    @content_view.addConstraint(due_date_right)

    # Owner

    owner_label = UILabel.alloc.init
    owner_label.text = "Owner"
    owner_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    owner_label.sizeToFit
    @content_view.addSubview(owner_label)

    owner_label.translatesAutoresizingMaskIntoConstraints = false
    owner_label_top = NSLayoutConstraint.constraintWithItem(owner_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @due_date, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 20.0)
    owner_label_right = NSLayoutConstraint.constraintWithItem(owner_label, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: due_date_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 0.0)
    @content_view.addConstraint(owner_label_top)
    @content_view.addConstraint(owner_label_right)

    @owner = UILabel.alloc.init
    @owner.text = @task.owner
    # owner.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    # owner.font = UIFont.fontWithName("Arial-ItalicMT", size: 20)
    @content_view.addSubview(@owner)

    @owner.translatesAutoresizingMaskIntoConstraints = false
    owner_top = NSLayoutConstraint.constraintWithItem(@owner, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: owner_label, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 0.0)
    owner_left = NSLayoutConstraint.constraintWithItem(@owner, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: owner_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 20.0)
    owner_right = NSLayoutConstraint.constraintWithItem(@owner, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: @content_view, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: -10.0)
    @content_view.addConstraint(owner_top)
    @content_view.addConstraint(owner_left)
    @content_view.addConstraint(owner_right)

    # State

    state_label = UILabel.alloc.init
    state_label.text = "State"
    state_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    state_label.sizeToFit
    @content_view.addSubview(state_label)

    state_label.translatesAutoresizingMaskIntoConstraints = false
    state_label_top = NSLayoutConstraint.constraintWithItem(state_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @owner, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 20.0)
    state_label_right = NSLayoutConstraint.constraintWithItem(state_label, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: owner_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 0.0)
    @content_view.addConstraint(state_label_top)
    @content_view.addConstraint(state_label_right)

    @state = UILabel.alloc.init
    if @task.completed == false
      @state.text = "Incomplete"
    else
      @state.text = "Complete"
    end
    # state.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    # state.font = UIFont.fontWithName("Arial-ItalicMT", size: 20)
    @content_view.addSubview(@state)

    @state.translatesAutoresizingMaskIntoConstraints = false
    state_top = NSLayoutConstraint.constraintWithItem(@state, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: state_label, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 0.0)
    state_left = NSLayoutConstraint.constraintWithItem(@state, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: state_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 20.0)
    state_right = NSLayoutConstraint.constraintWithItem(@state, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: @content_view, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: -10.0)
    @content_view.addConstraint(state_top)
    @content_view.addConstraint(state_left)
    @content_view.addConstraint(state_right)

    @separatorLine = UIView.alloc.init
    @separatorLine.backgroundColor = UIColor.lightGrayColor
    @content_view.addSubview(@separatorLine)

    @separatorLine.translatesAutoresizingMaskIntoConstraints = false
    separatorLine_top = NSLayoutConstraint.constraintWithItem(@separatorLine, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: title_label, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 0)
    separatorLine_left = NSLayoutConstraint.constraintWithItem(@separatorLine, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: title_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 10.0)
    separatorLine_width = NSLayoutConstraint.constraintWithItem(@separatorLine, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 1.0)
    separatorLine_bottom = NSLayoutConstraint.constraintWithItem(@separatorLine, attribute: NSLayoutAttributeBottom, relatedBy: NSLayoutRelationEqual, toItem: @state, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 0.0)
    @content_view.addConstraint(separatorLine_top)
    @content_view.addConstraint(separatorLine_left)
    @content_view.addConstraint(separatorLine_width)
    @content_view.addConstraint(separatorLine_bottom)

    # Notes

    @notes_label = UILabel.alloc.init
    @notes_label.text = "Notes"
    @notes_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    @notes_label.sizeToFit
    @content_view.addSubview(@notes_label)

    @notes_label.translatesAutoresizingMaskIntoConstraints = false
    notes_label_top = NSLayoutConstraint.constraintWithItem(@notes_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: state_label, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 40.0)
    notes_label_right = NSLayoutConstraint.constraintWithItem(@notes_label, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: state_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 0.0)
    @content_view.addConstraint(notes_label_top)
    @content_view.addConstraint(notes_label_right)

    @separatorLine3 = UIView.alloc.init
    @separatorLine3.backgroundColor = UIColor.lightGrayColor
    @content_view.addSubview(@separatorLine3)

    @separatorLine3.translatesAutoresizingMaskIntoConstraints = false
    separatorLine3_top = NSLayoutConstraint.constraintWithItem(@separatorLine3, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 10)
    separatorLine3_left = NSLayoutConstraint.constraintWithItem(@separatorLine3, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 0.0)
    separatorLine3_right = NSLayoutConstraint.constraintWithItem(@separatorLine3, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: @content_view, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: -20.0)
    separatorLine3_height = NSLayoutConstraint.constraintWithItem(@separatorLine3, attribute: NSLayoutAttributeHeight, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 1.0)
    @content_view.addConstraint(separatorLine3_top)
    @content_view.addConstraint(separatorLine3_left)
    @content_view.addConstraint(separatorLine3_right)
    @content_view.addConstraint(separatorLine3_height)

    # @notes = UILabel.alloc.init
    # mutable_attributed_string = NSMutableAttributedString.alloc.initWithString("")
    # @task.notes.each_with_index do |note, index|
    #   note_text = "#{index + 1} - #{note}"
    #   if index == 0
    #     mutable_attributed_string.insertAttributedString(NSAttributedString.alloc.initWithString(note_text), atIndex: 0)
    #     mutable_attributed_string.insertAttributedString(NSAttributedString.alloc.initWithString(" X"), atIndex: note_text.length)
    #   else
    #     mutable_attributed_string.insertAttributedString(NSAttributedString.alloc.initWithString("\n\n"), atIndex: mutable_attributed_string.length)
    #     mutable_attributed_string.insertAttributedString(NSAttributedString.alloc.initWithString(note_text), atIndex: mutable_attributed_string.length)
    #     mutable_attributed_string.insertAttributedString(NSAttributedString.alloc.initWithString(" X"), atIndex: mutable_attributed_string.length)
    #   end
    # end
    # @notes.attributedText = mutable_attributed_string
    # @notes.lineBreakMode = NSLineBreakByWordWrapping;
    # @notes.numberOfLines = 0
    # @content_view.addSubview(@notes)
    #
    # @notes.translatesAutoresizingMaskIntoConstraints = false
    # notes_top = NSLayoutConstraint.constraintWithItem(@notes, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: notes_label, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 0.0)
    # notes_left = NSLayoutConstraint.constraintWithItem(@notes, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: notes_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 20.0)
    # notes_right = NSLayoutConstraint.constraintWithItem(@notes, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: @content_view, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: -10.0)
    # @content_view.addConstraint(notes_top)
    # @content_view.addConstraint(notes_left)
    # @content_view.addConstraint(notes_right)

    @notes = UIView.alloc.init
    @last_note_box = nil
    @total_note_height = 0

    @task.notes.each_with_index do |note, index|

      trash_can = UIButton.buttonWithType(UIButtonTypeCustom)
      trash_can.setBackgroundImage(UIImage.imageNamed("Trash_Can-512.png"), forState: UIControlStateNormal)
      trash_can.tag = index
      trash_can.addTarget(self, action: "delete:", forControlEvents: UIControlEventTouchUpInside)
      @content_view.addSubview(trash_can)

      note_box = UILabel.alloc.init
      note_box.text = "#{index + 1} - #{note}"
      note_box.lineBreakMode = NSLineBreakByWordWrapping;
      note_box.numberOfLines = 0
      @content_view.addSubview(note_box)

      trash_can.translatesAutoresizingMaskIntoConstraints = false
      note_box.translatesAutoresizingMaskIntoConstraints = false
      if index == 0
        trash_can_top = NSLayoutConstraint.constraintWithItem(trash_can, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 20.0)
        trash_can_left = NSLayoutConstraint.constraintWithItem(trash_can, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 0.0)
        trash_can_height = NSLayoutConstraint.constraintWithItem(trash_can, attribute: NSLayoutAttributeHeight, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 20.0)
        trash_can_width = NSLayoutConstraint.constraintWithItem(trash_can, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: trash_can, attribute: NSLayoutAttributeHeight, multiplier: 1.0, constant: 0.0)

        note_box_top = NSLayoutConstraint.constraintWithItem(note_box, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 20.0)
        note_box_left = NSLayoutConstraint.constraintWithItem(note_box, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 50.0)
        note_box_width = NSLayoutConstraint.constraintWithItem(note_box, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: @content_view, attribute: NSLayoutAttributeWidth, multiplier: 1.0, constant: -100.0)
      else
        trash_can_top = NSLayoutConstraint.constraintWithItem(trash_can, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @last_note_box, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 20.0)
        trash_can_left = NSLayoutConstraint.constraintWithItem(trash_can, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 0.0)
        trash_can_height = NSLayoutConstraint.constraintWithItem(trash_can, attribute: NSLayoutAttributeHeight, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 20.0)
        trash_can_width = NSLayoutConstraint.constraintWithItem(trash_can, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: trash_can, attribute: NSLayoutAttributeHeight, multiplier: 1.0, constant: 0.0)

        note_box_top = NSLayoutConstraint.constraintWithItem(note_box, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @last_note_box, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 20.0)
        note_box_left = NSLayoutConstraint.constraintWithItem(note_box, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @last_note_box, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 0.0)
        note_box_width = NSLayoutConstraint.constraintWithItem(note_box, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: @last_note_box, attribute: NSLayoutAttributeWidth, multiplier: 1.0, constant: 0.0)
      end
      @content_view.addConstraint(trash_can_top)
      @content_view.addConstraint(trash_can_left)
      @content_view.addConstraint(trash_can_height)
      @content_view.addConstraint(trash_can_width)

      @content_view.addConstraint(note_box_top)
      @content_view.addConstraint(note_box_left)
      @content_view.addConstraint(note_box_width)

      note_box.setNeedsLayout
      note_box.layoutIfNeeded
      @last_note_box = note_box
      @total_note_height += + 20 + note_box.frame.size.height
    end

    @content_view.addSubview(@notes)

    @notes.translatesAutoresizingMaskIntoConstraints = false
    notes_top = NSLayoutConstraint.constraintWithItem(@notes, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 20.0)
    notes_left = NSLayoutConstraint.constraintWithItem(@notes, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 20.0)
    notes_right = NSLayoutConstraint.constraintWithItem(@notes, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: @content_view, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: -10.0)
    notes_bottom = NSLayoutConstraint.constraintWithItem(@notes, attribute: NSLayoutAttributeBottom, relatedBy: NSLayoutRelationEqual, toItem: @content_view, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 0.0)
    @content_view.addConstraint(notes_top)
    @content_view.addConstraint(notes_left)
    @content_view.addConstraint(notes_right)
    @content_view.addConstraint(notes_bottom)

    @add_note_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @add_note_button.setBackgroundImage(UIImage.imageNamed("button_add_note.png"), forState: UIControlStateNormal)
    @add_note_button.setBackgroundImage(UIImage.imageNamed("sync_button.png"), forState: UIControlStateDisabled)
    @add_note_button.addTarget(self, action: "add_note", forControlEvents: UIControlEventTouchUpInside)
    @content_view.addSubview(@add_note_button)

    @add_note_button.translatesAutoresizingMaskIntoConstraints = false
    if @last_note_box
      add_note_button_top = NSLayoutConstraint.constraintWithItem(@add_note_button, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @last_note_box, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 20)
      add_note_button_left = NSLayoutConstraint.constraintWithItem(@add_note_button, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @last_note_box, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 0.0)
      add_note_button_width = NSLayoutConstraint.constraintWithItem(@add_note_button, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 80.0)
      add_note_button_height = NSLayoutConstraint.constraintWithItem(@add_note_button, attribute: NSLayoutAttributeHeight, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 30.0)
    else
      add_note_button_top = NSLayoutConstraint.constraintWithItem(@add_note_button, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 30)
      add_note_button_left = NSLayoutConstraint.constraintWithItem(@add_note_button, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 50.0)
      add_note_button_width = NSLayoutConstraint.constraintWithItem(@add_note_button, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 80.0)
      add_note_button_height = NSLayoutConstraint.constraintWithItem(@add_note_button, attribute: NSLayoutAttributeHeight, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 30.0)
    end
    @content_view.addConstraint(add_note_button_top)
    @content_view.addConstraint(add_note_button_left)
    @content_view.addConstraint(add_note_button_width)
    @content_view.addConstraint(add_note_button_height)

    @separatorLine2 = UIView.alloc.init
    @separatorLine2.backgroundColor = UIColor.lightGrayColor
    @content_view.addSubview(@separatorLine2)

    @separatorLine2.translatesAutoresizingMaskIntoConstraints = false
    separatorLine2_top = NSLayoutConstraint.constraintWithItem(@separatorLine2, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 10)
    separatorLine2_left = NSLayoutConstraint.constraintWithItem(@separatorLine2, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: @notes_label, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: 30.0)
    separatorLine2_width = NSLayoutConstraint.constraintWithItem(@separatorLine2, attribute: NSLayoutAttributeWidth, relatedBy: NSLayoutRelationEqual, toItem: nil, attribute: 0, multiplier: 1.0, constant: 1.0)
    separatorLine2_bottom = NSLayoutConstraint.constraintWithItem(@separatorLine2, attribute: NSLayoutAttributeBottom, relatedBy: NSLayoutRelationEqual, toItem: @notes, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 0.0)
    @content_view.addConstraint(separatorLine2_top)
    @content_view.addConstraint(separatorLine2_left)
    @content_view.addConstraint(separatorLine2_width)
    @content_view.addConstraint(separatorLine2_bottom)

  end

  def viewWillAppear(animated)
    super
  end

  def viewDidLayoutSubviews
    super
    content_height = @nav_bar_height + 30 + @title.size.height + 20 + @due_date.size.height + 20 + @owner.size.height + 20 + @state.size.height + 40 + @notes_label.size.height + @total_note_height + 20 + @add_note_button.size.height + 20 + @tab_bar_height
    @content_view.frame = [@content_view.frame.origin,[self.view.size.width, content_height]]
    @scroll_view.setContentSize([self.view.size.width, content_height])
  end

  def edit_task
    edit_task_controller = EditTaskController.alloc.initWithTask(@task)
    edit_task_controller.parent_controller = self
    self.presentViewController(UINavigationController.alloc.initWithRootViewController(edit_task_controller), animated: true, completion: lambda {})
  end

  def add_note
    add_note_controller = UIAlertController.alertControllerWithTitle("New Note", message: nil, preferredStyle: UIAlertControllerStyleAlert)

    note_field = UITextField.alloc.init

    add_note_controller.addTextFieldWithConfigurationHandler(proc do |note_field|
      note_field.clearButtonMode = UITextFieldViewModeWhileEditing
    end)

    save_action = UIAlertAction.actionWithTitle("Save", style: UIAlertActionStyleDefault, handler: proc { |arg| save_note(note_field.text) })
    cancel_action = UIAlertAction.actionWithTitle("Cancel", style: UIAlertActionStyleDefault, handler: proc { |arg| })

    add_note_controller.addAction(save_action)
    add_note_controller.addAction(cancel_action)

    self.presentViewController(add_note_controller, animated: true, completion: lambda {})
  end

  def delete(trash_can_button)
    note_index = trash_can_button.tag
    @task.notes.delete_at(note_index)
    Task.save_tasks(parent_controller.type, parent_controller.list)
    self.viewDidLoad
    self.viewWillAppear(true)
  end

  def save_note(note)
    if !note.empty?
      note = "#{note} [#{Time.now.strftime("%d/%m/%Y %H:%M")}]"
      @task.notes << note
      Task.save_tasks(parent_controller.type, parent_controller.list)
      self.viewDidLoad
      self.viewWillAppear(true)
    end
  end

  # def cancel_note
  #   self.dismissViewControllerAnimated(true, completion: lambda {})
  # end



end
