for repo in `cat repos`; do
  name=$(echo ${repo} | cut -f2 -d/)
  git submodule add --name ${name} https://github.com/${repo} pack/bundle/opt/${name}
  sleep 10
done
