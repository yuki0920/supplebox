import axios from 'axios'

if (process.env.NODE_ENV !== 'test') {
  axios.defaults.headers['X-CSRF-TOKEN'] = document.querySelector('[name="csrf-token"]').getAttribute('content')
}

export default axios
