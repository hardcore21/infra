Інфраструктурний репозиторій
створення інстансу

``` sh
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20190325a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b reddit-app
```
