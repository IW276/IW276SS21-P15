sudo docker stop my_container_as_15
sudo docker rm my_container_as_15
sudo docker build -t as15_my_img .
sudo docker run --name my_container_as_15 as15_my_img