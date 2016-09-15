cd $HOME

git clone git@github.com:cityofaustin/pages.git pages
cd pages

git checkout -b gh-pages origin/gh-pages

git submodule sync --recursive
git submodule init
git submodule update --recursive --remote

git config --global user.email "cityofaustin@users.noreply.github.com"
git config --global user.name "cityofaustin/pages"

if [ -n "$(git status --porcelain)" ]; then 
  git add .
  git commit -m "Update gh-pages submodules (CI commit)" 
  git push origin gh-pages
fi
