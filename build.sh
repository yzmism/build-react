#!/bin/bash
PROJECT_NAME=${1?Error: Please input a project name.}
CONFIG_WEBPACK=webpack.config.js
CONFIG_BABEL=.babelrc

mkdir "$PROJECT_NAME"
cd ./"$PROJECT_NAME"

echo "Initiating npm"
npm init -y

echo "Installing React"
npm install --save-dev react react-dom

echo "Installing Webpack"
npm install --save-dev  webpack webpack-cli
echo "module.exports = {
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        }
      }
    ]
  }
};" >> $CONFIG_WEBPACK

echo "Installing Babel"
npm install --save-dev @babel/core @babel/preset-env @babel/preset-react babel-loader
echo "{
    "presets": ["@babel/preset-env", "@babel/preset-react"]
}" >> $CONFIG_BABEL

echo "Creating folder structure"
mkdir -p build/ public/assets/
mkdir -p src/{state/{ducks/,utils/},utilities/,views/{routes/,components/,layouts/,styles}}
sudo tree -d src/ build/ public/
