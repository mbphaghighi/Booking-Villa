<template>
    <div class="w-50 m-auto">
        <div class="card card-body">
            <form>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input
                            type="text"
                            name="email"
                            placeholder="Enter your email"
                            class="form-control"
                            v-model="email"
                            :class="[{'is-invalid': errorFor('email')}]"
                    />
                    <div class="invalid-feedback" v-for="error in errorFor('email')">{{error}}</div>
                </div>

                <div class="form-group">
                    <label for="email">Password</label>
                    <input
                            type="password"
                            name="password"
                            placeholder="Enter your password"
                            class="form-control"
                            v-model="password"
                            :class="[{'is-invalid': errorFor('password')}]"
                    />
                    <div class="invalid-feedback" v-for="error in errorFor('password')">{{error}}</div>
                </div>

                <button
                        type="submit"
                        class="btn btn-primary btn-lg btn-block"
                        :disabled="loading"
                        @click.prevent="login"
                >Login</button>

                <hr />

                <div>
                    No account yet?
                    <router-link :to="{name: 'register'}" class="font-weight-bold">Register</router-link>
                </div>

                <div>
                    Forgotten password?
                    <router-link :to="{name: 'home'}" class="font-weight-bold">Reset password</router-link>
                </div>
            </form>
        </div>
    </div>
</template>

<script>

    import { logIn } from "./../shared/utils/auth";

    export default {
        data() {
            return {
                email: null,
                password: null,
                loading: false,
                errors:null,
            };
        },
        methods: {
            async login() {
                this.loading = true;
                this.errors = null;
                try {
                    await axios.get("/sanctum/csrf-cookie");
                    await axios.post("/login", {
                        email: this.email,
                        password: this.password
                    });
                    logIn();
                    this.$store.dispatch("loadUser");
                    this.$router.push({ name: "home" });
                } catch (error) {
                    this.errors = error.response && error.response.data.errors;
                }
                this.loading = false;
            },
            errorFor(field){
                return this.errors!==null && this.errors[field] ? this.errors[field] : null;
            }
        }
    };
</script>