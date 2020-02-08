export default function ({ app, redirect }) {
  if (app.$auth) {
    if (app.$auth.hasScope('worker')) {
    } else {
      console.log('user is logged-in but no privillage')
      return redirect(app.$front_url('/sessions/new'))
    }
  } else {
    console.log('user is not logged-in')
    return redirect(app.$front_url('/sessions/new'))
  }
}
