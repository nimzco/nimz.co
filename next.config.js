const withSass = require('@zeit/next-sass');
const withTypescript = require('@zeit/next-typescript');
const withImages = require('next-images');

module.exports = withSass(
  withImages(
    withTypescript({
      target: 'serverless',
      cssModules: true,
      cssLoaderOptions: {
        importLoaders: 1,
        localIdentName: '[local]___[hash:base64:5]',
      },
    })
  )
);
