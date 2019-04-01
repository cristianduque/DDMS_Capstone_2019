const routes = [
//{ path: '/', component: Home},
   { path: '/Approvals', component: Approvals},
   { path: '/Planning', component: Planning},
   { path: '/Report', component: Report},
   { path: '/ManageLists', component: ManageLists}

];
const router = new VueRouter({
      routes // short for `routes: routes`
   });
