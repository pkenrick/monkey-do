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

    title_label = UILabel.alloc.initWithFrame(CGRectZero)
    title_label.text = "Title"
    title_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    title_label.sizeToFit
    title_label.frame = [[(self.view.frame.size.width / 3) - title_label.frame.size.width - 10, self.view.frame.size.height / 10 + nav_bar_height], title_label.frame.size]
    self.view.addSubview(title_label)

    @title = UITextLabel.alloc.initWithFrame(CGRectZero)
    @title.text = @task.title
    @title.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    @title.sizeToFit
    @title.frame = [[self.view.frame.size.width / 3 + 10, title_label.frame.origin.y], @title.frame.size]

    # @title.frame = [[self.view.frame.size.width / 3 + 10, title_label.frame.origin.y],[self.view.frame.size.width / 3 * 1.5, 30]]
    self.view.addSubview(@title)

    due_date_label = UILabel.alloc.initWithFrame(CGRectZero)
    due_date_label.text = "Due date"
    due_date_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    due_date_label.sizeToFit
    due_date_label.frame = [[(self.view.frame.size.width / 3) - due_date_label.frame.size.width - 10, self.view.frame.size.height / 10 * 2 + nav_bar_height], due_date_label.frame.size]
    self.view.addSubview(due_date_label)

    @due_date = UILabel.alloc.initWithFrame(CGRectZero)
    @due_date.text = @task.due_date
    @due_date.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    @due_date.sizeToFit
    @due_date.frame = [[self.view.frame.size.width / 3 + 10, due_date_label.frame.origin.y], @due_date.frame.size]
    self.view.addSubview(@due_date)

    notes_label = UILabel.alloc.initWithFrame(CGRectZero)
    notes_label.text = "Notes"
    notes_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    notes_label.sizeToFit
    notes_label.frame = [[(self.view.frame.size.width / 3) - notes_label.frame.size.width - 10, self.view.frame.size.height / 10 * 3 + nav_bar_height], notes_label.frame.size]
    self.view.addSubview(notes_label)

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
