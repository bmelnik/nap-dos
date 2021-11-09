docker build -t nap-dos-grpc ~/projects/nap-dos/ && docker stop my-app-protect-dos && docker run --rm --name my-app-protect-dos -p 80:80 -p 50061:50061 -d nap-dos-grpc && docker logs my-app-protect-dos; echo done


