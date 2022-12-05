/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./public/**/*.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    // colors: {
    //   // h1: 'black',
    //   // searchbarbg: '#F7F7F7' # carbon-50
    //   // searchbartext: '#9C9C9C',
    //   // producttext: '#363636', # carbon-800
    //   // price: '#FF6669', # red
    //   // priceold: '#9C9C9C' # carbon-400
    //   // buttonbg: '#1AB76C',
    //   // morelink: '#1AB76C'

    //   // buttontext: 'white'

    // },
    extend: {},
  },
  plugins: [
    require('@tailwindcss/line-clamp'),
  ],
}
