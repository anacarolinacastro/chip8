build:
	docker build -t chip8 .
run:
	docker run -it --rm  -v $(shell pwd):/files --workdir=/files chip8 ruby main.rb

irb:
	docker run -it --rm  -v $(shell pwd):/files --workdir=/files chip8 irb -r ./chip8.rb

container:
	docker run -it --rm  -v $(shell pwd):/files --workdir=/files chip8 bash

test:
	docker run -it --rm  -v $(shell pwd):/files --workdir=/files chip8 rspec *_rspec.rb
