export const getUserInfo = (vm) => {
  vm.$http.get('users').then(resp => {
    console.log('resp' + resp)
  })
}
