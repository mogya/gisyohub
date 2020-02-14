export default function ({ app, route, redirect }) {
  if (app.$auth) {
    if (app.$auth.hasScope('worker') || app.$auth.hasScope('administrator')) {
      // Okay, go.
    } else {
      console.log('user is logged-in but no privillage')
      app.$cookies.set('auth.redirect', route.fullPath)
      return redirect('/sessions/new')
    }
  } else {
    console.log('user is not logged-in')
    app.$cookies.set('auth.redirect', route.fullPath)
    return redirect('/sessions/new')
  }
}
