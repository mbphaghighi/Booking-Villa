import Bookables from './bookables/Bookables';
import Advertise from './bookables/Advertise';
import Bookable from './bookable/Bookable';
import Review from './Review/Review';
import Basket from './basket/Basket';
import Login from './auth/Login';
import Register from './auth/Register';
import Profile from './auth/Profile';

import VueRouter from 'vue-router';

const routes = [{
    path: '/',
    component: Bookables,
    name: 'home'
},
    {
        path: '/bookable/:id',
        component: Bookable,
        name: 'bookable'
    },
    {
        path: '/review/:id',
        component: Review,
        name: 'review'
    },
    {
        path: '/basket',
        component: Basket,
        name: 'basket'
    },
    {
        path: '/auth/login',
        component: Login,
        name: 'login'
    },

    {
        path: '/auth/register',
        component: Register,
        name: 'register'
    },
    {
        path: '/auth/profile/:id',
        component: Profile,
        name: 'profile'
    },
    {
        path: '/host/advertise',
        component:Advertise,
        name: 'advertise'
    },
];

const router = new VueRouter({
    routes,
    mode: 'history'
});
export default router;