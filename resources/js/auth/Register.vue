<template>
    <div class="w-50 m-auto">
        <div class="card card-body">
            <form>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input
                            type="text"
                            name="name"
                            placeholder="Enter your name"
                            class="form-control"
                            v-model="user.name"
                            :class="[{'is-invalid': errorFor('name')}]"
                    />
                    <div class="invalid-feedback" v-for="error in errorFor('name')">{{error}}</div>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input
                            type="text"
                            name="email"
                            placeholder="Enter your e-mail"
                            class="form-control"
                            v-model="user.email"
                            :class="[{'is-invalid': errorFor('email')}]"
                    />
                    <div class="invalid-feedback" v-for="error in errorFor('email')">{{error}}</div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input
                            type="password"
                            name="password"
                            placeholder="Enter your password"
                            class="form-control"
                            v-model="user.password"
                            :class="[{'is-invalid': errorFor('password')}]"
                    />
                    <div class="invalid-feedback" v-for="error in errorFor('password')">{{error}}</div>
                </div>

                <div class="form-group">
                    <label for="password_confirmation">Re-type Password</label>
                    <input
                            type="password"
                            name="password_confirmation"
                            placeholder="Confirm your password"
                            class="form-control"
                            v-model="user.password_confirmation"
                            :class="[{'is-invalid': errorFor('password_confirmation')}]"
                    />
                    <div class="invalid-feedback" v-for="error in errorFor('password_confirmation')">{{error}}</div>
                </div>

                <button
                        type="submit"
                        class="btn btn-primary btn-lg btn-block"
                        :disabled="loading"
                        @click.prevent="register"
                >Register</button>

                <hr />

                <div>
                    Already have an account?
                    <router-link :to="{name: 'login'}" class="font-weight-bold">Log-in</router-link>
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
                user: {
                    name: null,
                    email: null,
                    password: null,
                    password_confirmation: null
                },
                loading: false,
                errors:null,
            };
        },
        methods: {
            async register() {
                this.loading = true;
                this.errors = null;

                try {
                    const response = await axios.post("/register", this.user);

                    if (201 === response.status) {
                        logIn();
                        this.$store.dispatch("loadUser");
                        this.$router.push({ name: "home" });
                    }
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