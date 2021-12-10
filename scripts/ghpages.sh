npm install
npm run build

cd ./build
touch .nojekyll

git init
git add .
git commit -m "initial commit"

git remote add origin "https://github.com/cowboycodr/cowboycodr.github.io"

git push origin -f master

cd ..
rm -rf build