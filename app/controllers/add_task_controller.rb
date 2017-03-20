class AddTaskController < UIViewController

  attr_accessor :parent_controller, :title_field, :due_date_field, :note_field

  def viewDidLoad
    super

    nav_bar_height = self.navigationController.navigationBar.frame.size.height + 20

    self.title = "Add Task"
    # self.view.backgroundColor = UIColor.colorWithRed(188.0/255.0, green:225.0/255.0, blue:255.0/255.0, alpha:1.0)
    self.view.backgroundColor = UIColor.whiteColor
    background_image_view = UIImageView.alloc.initWithFrame(self.view.bounds)
    background_image_view.setImage(UIImage.imageNamed("blue_pink_clear.jpg"))
    background_image_view.alpha = 0.7
    self.view.addSubview(background_image_view)

    title_label = UILabel.alloc.initWithFrame(CGRectZero)
    title_label.text = "Title"
    title_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    title_label.sizeToFit
    title_label.frame = [[(self.view.frame.size.width / 3) - title_label.frame.size.width - 10, self.view.frame.size.height / 10 + nav_bar_height], title_label.frame.size]
    self.view.addSubview(title_label)

    @title_field = UITextField.alloc.initWithFrame(CGRectZero)
    @title_field.borderStyle = UITextBorderStyleNone
    @title_field.backgroundColor = UIColor.whiteColor
    @title_field.placeholder = " e.g. 'Buy shampoo'"
    @title_field.frame = [[self.view.frame.size.width / 3 + 10, title_label.frame.origin.y],[self.view.frame.size.width / 3 * 1.5, 30]]
    self.view.addSubview(@title_field)

    due_date_label = UILabel.alloc.initWithFrame(CGRectZero)
    due_date_label.text = "Due date"
    due_date_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    due_date_label.sizeToFit
    due_date_label.frame = [[(self.view.frame.size.width / 3) - due_date_label.frame.size.width - 10, self.view.frame.size.height / 10 * 2 + nav_bar_height], due_date_label.frame.size]
    self.view.addSubview(due_date_label)

    @due_date_field = UITextField.alloc.initWithFrame(CGRectZero)
    @due_date_field.borderStyle = UITextBorderStyleNone
    @due_date_field.backgroundColor = UIColor.whiteColor
    @due_date_field.placeholder = " e.g. '31/01/2019'"
    @due_date_field.frame = [[self.view.frame.size.width / 3 + 10, due_date_label.frame.origin.y],[self.view.frame.size.width / 3 * 1.5, 30]]
    self.view.addSubview(@due_date_field)

    notes_label = UILabel.alloc.initWithFrame(CGRectZero)
    notes_label.text = "Notes"
    notes_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    notes_label.sizeToFit
    notes_label.frame = [[(self.view.frame.size.width / 3) - notes_label.frame.size.width - 10, self.view.frame.size.height / 10 * 3 + nav_bar_height], notes_label.frame.size]
    self.view.addSubview(notes_label)

    @notes_field = UITextView.alloc.initWithFrame([[self.view.frame.size.width / 3 + 10, notes_label.frame.origin.y],[self.view.frame.size.width / 3 * 1.5, 150]], textContainer: nil)
    @notes_field.text = "e.g. 'Shop was closed today.  Will get this tomorrow.'"
    @notes_field.font = UIFont.systemFontOfSize(17)
    @notes_field.textColor = UIColor.colorWithRed(199.0/255.0, green:199.0/255.0, blue:205.0/255.0, alpha:1.0)
    self.view.addSubview(@notes_field)

    @notes_field.delegate = self

    gesture_recogizer = UITapGestureRecognizer.alloc.initWithTarget(self, action: "dismiss_keyboard")
    gesture_recogizer.cancelsTouchesInView = false
    self.view.addGestureRecognizer(gesture_recogizer)

    create_task_button = UIButton.buttonWithType(UIButtonTypeSystem)
    create_task_button.setTitle("Create Task", forState: UIControlStateNormal)
    create_task_button.setTitleColor(UIColor.blackColor, forState: UIControlStateNormal)
    create_task_button.titleLabel.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    create_task_button.backgroundColor = UIColor.colorWithRed(188.0/255.0, green:225.0/255.0, blue:255.0/255.0, alpha:1.0)
    create_task_button.frame = [[self.view.frame.size.width / 2 - self.view.frame.size.width * 3/4 / 2, self.view.frame.size.height / 10 * 7 + nav_bar_height], [self.view.frame.size.width * 3/4, self.view.frame.size.height / 10]]
    create_task_button.layer.cornerRadius = 10
    self.view.addSubview(create_task_button)
    create_task_button.addTarget(self, action: "create_task", forControlEvents: UIControlEventTouchUpInside)

    cancel_button = UIButton.buttonWithType(UIButtonTypeSystem)
    cancel_button.setTitle("Cancel", forState: UIControlStateNormal)
    cancel_button.setTitleColor(UIColor.blackColor, forState: UIControlStateNormal)
    cancel_button.titleLabel.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    cancel_button.sizeToFit
    cancel_button.frame = [[self.view.frame.size.width / 2 - cancel_button.frame.size.width / 2, self.view.frame.size.height / 10 * 8 + nav_bar_height + 10], cancel_button.frame.size]
    self.view.addSubview(cancel_button)
    cancel_button.addTarget(self, action: "cancel_task", forControlEvents: UIControlEventTouchUpInside)
  end

  def textViewDidBeginEditing(textView)
    if textView.text == "e.g. 'Shop was closed today.  Will get this tomorrow.'"
      textView.text = ""
      textView.textColor = UIColor.blackColor
    end
  end

  def textViewDidEndEditing(textView)
    if textView.text == ""
      textView.text = "e.g. 'Shop was closed today.  Will get this tomorrow.'"
      textView.textColor = UIColor.colorWithRed(199.0/255.0, green:199.0/255.0, blue:205.0/255.0, alpha:1.0)
    end
  end

  def create_task
    new_task = Task.new
    new_task.title = @title_field.text
    new_task.due_date = @due_date_field.text
    new_task.notes = @notes_field.text
    new_task.completed = false
    self.parent_controller.list << new_task
    Task.save_tasks(self.parent_controller.type, self.parent_controller.list)
    self.parent_controller.table.reloadData
    self.dismissViewControllerAnimated(true, completion: lambda {})
  end

  def dismiss_keyboard
    self.view.endEditing(true)
  end

  def cancel_task
    self.dismissViewControllerAnimated(true, completion: lambda {})
  end


end
