import axios from 'axios'
const element = document.querySelector('[name="csrf-token"]')

if (process.env.NODE_ENV !== 'test' && element) {
  axios.defaults.headers['X-CSRF-TOKEN'] = element.getAttribute('content')
}

export default axios
export { AxiosPromise, AxiosInstance } from 'axios'
