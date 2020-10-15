IMG="movie_rec_notebook"
docker stop $IMG
sleep 1
while getopts "bk" arg
do
  case $arg in
    b)
      docker image tag $IMG:latest $IMG:`date +"%s"`
      docker build --no-cache -t $IMG:latest -f model_dev/Dockerfile model_dev/
      ;;
    k)
      exit 0
      ;;
    ?)
      echo "Unknown args $args with value $OPTARG"
      exit 1
      ;;
  esac
done
echo `pwd`
docker run -d --runtime=nvidia --gpus device=1 --name $IMG --rm -it -v `pwd`:/workspace -p 8000:8888 $IMG:latest
