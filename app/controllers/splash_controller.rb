class SplashController < UIViewController

  def viewDidLoad
    super

    self.title = "SplashScreen"
    self.view.backgroundColor = UIColor.yellowColor

    monkey_boy = UIImageView.alloc.initWithImage(UIImage.imageNamed("MonkeyBoy.png"))
    monkey_boy.frame = CGRect.new([self.view.frame.size.width / 2 - self.view.frame.size.width / 3, self.view.frame.size.height / 2 - self.view.frame.size.width / 3],[self.view.frame.size.width / 3 , self.view.frame.size.width / 3])
    monkey_boy.backgroundColor = UIColor.yellowColor
    monkey_boy.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin
    monkey_girl = UIImageView.alloc.initWithImage(UIImage.imageNamed("MonkeyGirl.png"))
    monkey_girl.frame = CGRect.new([monkey_boy.frame.origin.x + monkey_boy.frame.size.width, monkey_boy.frame.origin.y],[monkey_boy.frame.size.width , monkey_boy.frame.size.height])
    monkey_girl.backgroundColor = UIColor.yellowColor
    monkey_girl.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin

    self.view.addSubview(monkey_boy)
    self.view.addSubview(monkey_girl)

    title_label = UILabel.alloc.initWithFrame(CGRectZero)
    title_label.text = "Monkey-Do!"
    title_label.frame = [[monkey_boy.frame.origin.x,self.view.frame.size.height / 2 + monkey_boy.frame.size.height / 6], [monkey_boy.frame.size.width + monkey_girl.frame.size.width, monkey_boy.frame.size.height / 2]]
    title_label.font = UIFont.fontWithName("Chalkduster", size: 100)
    title_label.adjustsFontSizeToFitWidth = true
    title_label.numberOfLines = 0
    title_label.backgroundColor = UIColor.yellowColor
    title_label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin

    self.view.addSubview(title_label)

    slogan_label = UILabel.alloc.initWithFrame(CGRectZero)
    slogan_label.text = "The to-do list app for couples"
    slogan_label.font = UIFont.fontWithName("AmericanTypewriter", size: 20)
    slogan_label.sizeToFit
    slogan_label.center = [self.view.frame.size.width / 2, title_label.frame.origin.y + title_label.frame.size.height + title_label.frame.size.height / 2]
    slogan_label.backgroundColor = UIColor.yellowColor
    slogan_label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin

    self.view.addSubview(slogan_label)

    action_label = UILabel.alloc.initWithFrame(CGRectZero)
    action_label.text = "Touch to start"
    action_label.font = UIFont.fontWithName("AmericanTypewriter", size: 15)
    action_label.sizeToFit
    action_label.center = [self.view.frame.size.width / 2, self.view.frame.size.height - action_label.frame.size.height * 2]
    action_label.backgroundColor = UIColor.yellowColor
    action_label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin

    self.view.addSubview(action_label)
  end

end
