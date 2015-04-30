class CoachArmchairViewController < UIViewController

	def loadView
		self.view = UIImageView.alloc.init
	end

	def viewDidLoad
		view.image = UIImage.imageNamed('background.png')

		@bubble = makeBubble
		@label = makeLabel

		
		view.addSubview(@bubble)
		@bubble.addSubview(@label)

		view.UserInteractionEnabled = true
		recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'showAnswer')
		view.addGestureRecognizer(recognizer)

		@coach = CoachArmchair.new
	end

	def showAnswer
		UIView.animateWithDuration(1.0,
																animations:lambda {
																	@label.alpha = 0
																	@label.transform = CGAffineTransformMakeScale(0.1, 0.1)
																	},
																	completion:lambda { |finished|
																		@label.text = @coach.randomAnswer
																		UIView.animateWithDuration(1.0,
																															animations:lambda{
																																@label.alpha = 1
																																@label.transform = CGAffineTransformIdentity
																																})
																	})
	end

	def makeLabel

		label = UILabel.alloc.initWithFrame([[0, 0], [350, 70]])
		label.styleId = 'shouting_label'
		# label.backgroundColor = UIColor.lightGrayColor
		label.text = 'Wanna know what I think??'
		label.font = UIFont.boldSystemFontOfSize(16)
		label.textColor = UIColor.blackColor
		label.textAlignment = UITextAlignmentCenter

		label

	end

	def makeBubble
		bubble = UIImageView.alloc.initWithFrame([[10, 60], [400, 90]])
		bubble.styleId = 'speech_bubble'
		bubble.image = UIImage.imageNamed('speech_bubble.png')

		bubble
	end

end