/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./resources/**/*.blade.php",
    "./resources/**/*.js",
    "./resources/**/*.vue",
  ],
  theme: {
    extend: {
      colors: {
        'juva-white': '#FFFFFF',
        'juva-grey': '#F5F6FA',
        'juva-black': '#00000',
      }
    },
    container: {
      center: true,
      padding: {
        DEFAULT: '2rem',
        sm: '4rem',
        lg: '6rem',
        xl: '7rem',
        '2xl': '8rem',
      },
    },
  },
  plugins: [],
  safelist: [
    'bg-juva-grey',
  ]
}

