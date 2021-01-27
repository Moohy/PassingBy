module.exports = {
  plugins: [
  require('./app/javascript/packs/tailwind.config.js'),
	require('tailwindcss'),
	  require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}
