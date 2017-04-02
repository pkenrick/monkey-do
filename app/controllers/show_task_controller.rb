class ShowTaskController < UIViewController

  attr_accessor :parent_controller, :task

  def initWithTask(task)
    self.initWithNibName(nil, bundle: nil)
    @task = task
    self
  end

  def viewDidLoad
    super

    nav_bar_height = self.navigationController.navigationBar.frame.size.height + 20

    self.title = "Task Details"
    self.view.backgroundColor = UIColor.whiteColor
    background_image_view = UIImageView.alloc.initWithFrame(self.view.bounds)
    background_image_view.setImage(UIImage.imageNamed("blue_pink_clear.jpg"))
    background_image_view.alpha = 0.7
    self.view.addSubview(background_image_view)

    edit_task_button = UIBarButtonItem.alloc.initWithTitle("Edit", style: UIBarButtonItemStyleBordered, target: self, action: "edit_task")
    self.navigationItem.rightBarButtonItem = edit_task_button

    # Task title

    title_label = UILabel.alloc.init
    title_label.text = "Title"
    title_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    title_label.backgroundColor = UIColor.redColor
    title_label.sizeToFit
    self.view.addSubview(title_label)

    title_label.translatesAutoresizingMaskIntoConstraints = false
    title_label_top = NSLayoutConstraint.constraintWithItem(title_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: self.view, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: nav_bar_height + 10.0)
    title_label_right = NSLayoutConstraint.constraintWithItem(title_label, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: self.view, attribute: NSLayoutAttributeLeft, multiplier: 1.0, constant: self.view.size.width / 4)
    self.view.addConstraint(title_label_top)
    self.view.addConstraint(title_label_right)

    @title = UILabel.alloc.init
    @title.text = @task.title
    @title.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    @title.backgroundColor = UIColor.redColor
    @title.lineBreakMode = NSLineBreakByWordWrapping;
    @title.numberOfLines = 0
    self.view.addSubview(@title)

    @title.translatesAutoresizingMaskIntoConstraints = false
    title_top = NSLayoutConstraint.constraintWithItem(@title, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: title_label, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 0.0)
    title_left = NSLayoutConstraint.constraintWithItem(@title, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: title_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 20.0)
    title_right = NSLayoutConstraint.constraintWithItem(@title, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: self.view, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: -10.0)
    self.view.addConstraint(title_top)
    self.view.addConstraint(title_left)
    self.view.addConstraint(title_right)

    # Task due date

    due_date_label = UILabel.alloc.init
    due_date_label.text = "Due date"
    due_date_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    due_date_label.backgroundColor = UIColor.redColor
    due_date_label.sizeToFit
    self.view.addSubview(due_date_label)

    due_date_label.translatesAutoresizingMaskIntoConstraints = false
    due_date_label_top = NSLayoutConstraint.constraintWithItem(due_date_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: @title, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 10.0)
    due_date_label_right = NSLayoutConstraint.constraintWithItem(due_date_label, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: title_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 0.0)
    self.view.addConstraint(due_date_label_top)
    self.view.addConstraint(due_date_label_right)

    @due_date = UILabel.alloc.init
    @due_date.text = @task.due_date
    @due_date.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    @due_date.backgroundColor = UIColor.redColor
    self.view.addSubview(@due_date)

    @due_date.translatesAutoresizingMaskIntoConstraints = false
    due_date_top = NSLayoutConstraint.constraintWithItem(@due_date, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: due_date_label, attribute: NSLayoutAttributeTop, multiplier: 1.0, constant: 0.0)
    due_date_left = NSLayoutConstraint.constraintWithItem(@due_date, attribute: NSLayoutAttributeLeft, relatedBy: NSLayoutRelationEqual, toItem: due_date_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 20.0)
    due_date_right = NSLayoutConstraint.constraintWithItem(@due_date, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: self.view, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: -10.0)
    self.view.addConstraint(due_date_top)
    self.view.addConstraint(due_date_left)
    self.view.addConstraint(due_date_right)

    # Owner

    owner_label = UILabel.alloc.init
    owner_label.text = "Owner"
    owner_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    owner_label.backgroundColor = UIColor.redColor
    owner_label.sizeToFit
    self.view.addSubview(owner_label)

    owner_label.translatesAutoresizingMaskIntoConstraints = false
    owner_label_top = NSLayoutConstraint.constraintWithItem(owner_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: due_date_label, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 10.0)
    owner_label_right = NSLayoutConstraint.constraintWithItem(owner_label, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: due_date_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 0.0)
    self.view.addConstraint(owner_label_top)
    self.view.addConstraint(owner_label_right)

    # State

    state_label = UILabel.alloc.init
    state_label.text = "State"
    state_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    state_label.backgroundColor = UIColor.redColor
    state_label.sizeToFit
    self.view.addSubview(state_label)

    state_label.translatesAutoresizingMaskIntoConstraints = false
    state_label_top = NSLayoutConstraint.constraintWithItem(state_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: owner_label, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 10.0)
    state_label_right = NSLayoutConstraint.constraintWithItem(state_label, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: owner_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 0.0)
    self.view.addConstraint(state_label_top)
    self.view.addConstraint(state_label_right)

    # Notes

    notes_label = UILabel.alloc.init
    notes_label.text = "Notes"
    notes_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    notes_label.sizeToFit
    self.view.addSubview(notes_label)

    notes_label.translatesAutoresizingMaskIntoConstraints = false
    notes_label_top = NSLayoutConstraint.constraintWithItem(notes_label, attribute: NSLayoutAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: state_label, attribute: NSLayoutAttributeBottom, multiplier: 1.0, constant: 40.0)
    notes_label_right = NSLayoutConstraint.constraintWithItem(notes_label, attribute: NSLayoutAttributeRight, relatedBy: NSLayoutRelationEqual, toItem: state_label, attribute: NSLayoutAttributeRight, multiplier: 1.0, constant: 0.0)
    self.view.addConstraint(notes_label_top)
    self.view.addConstraint(notes_label_right)

    @notes = UILabel.alloc.initWithFrame(CGRectZero)
    @notes.text = @task.notes
    @notes.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    @notes.sizeToFit
    @notes.frame = [[self.view.frame.size.width / 3 + 10, notes_label.frame.origin.y], @notes.frame.size]
    self.view.addSubview(@notes)
  end

  def viewWillAppear(animated)
    super
    @title.text = @task.title
    @title.sizeToFit
    @due_date.text = @task.due_date
    @due_date.sizeToFit
    @notes.text = @task.notes
    @notes.sizeToFit
end

  def edit_task
    edit_task_controller = EditTaskController.alloc.initWithTask(@task)
    edit_task_controller.parent_controller = self
    self.presentViewController(UINavigationController.alloc.initWithRootViewController(edit_task_controller), animated: true, completion: lambda {})
  end

end
