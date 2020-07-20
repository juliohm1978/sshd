VERSION=8.2p1-4ubuntu0.1
TAG=juliohm/sshd

docker:
	docker build -t $(TAG):latest --build-arg=SSHD_VERSION=$(VERSION) .
	docker tag $(TAG):latest $(TAG):$(VERSION)

push: docker
	docker push $(TAG):latest
	docker push $(TAG):$(VERSION)

start:
	-docker run -d --name sshd $(TAG):$(VERSION)
	docker start sshd

stop:
	docker stop -t0 sshd

rm: stop
	docker rm sshd
 