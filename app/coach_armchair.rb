class CoachArmchair

	def initialize
		# @answers = loadAnswers
		@answers = loadAnswersApi
	end

	def defaultAnswers
		answerFile = NSBundle.mainBundle.pathForResource('answers', ofType:'json')

		errorPointer = Pointer.new(:object)

		data = NSData.alloc.initWithContentsOfFile(answerFile,
																								options:NSDataReadingUncached,
																								error:errorPointer)
	
		unless data
			printError errorPointer[0]
			return defaultAnswers
		end

		json = NSJSONSerialization.JSONObjectWithData(data,
																									options:NSDataReadingUncached,
																									error:errorPointer)

		unless json
			printError errorPointer[0]
			return defaultAnswers
		end

		json['answers']

	end

	def loadAnswersApi

		url = "http://armchair-coach.herokuapp.com/phrases.json"

		errorPointer = Pointer.new(:object)

		data = NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(url),
																								options:NSDataReadingUncached,
																								error:errorPointer)
	
		unless data
			printError errorPointer[0]
			return defaultAnswers
		end

		json = NSJSONSerialization.JSONObjectWithData(data,
																									options:NSDataReadingUncached,
																									error:errorPointer)

		unless json
			printError errorPointer[0]
			return defaultAnswers
		end

		json

	end

	def printError(error)
		$stderr.puts "Error: #{error.description}"
	end

	def randomAnswer

		@response = []

		@answers.each {|item| @response << item['text'] }

		@response.sample
	end


end