<template>
    <div class="text-center success">
        <i class="fas fa-thumbs-up" style="color:#b0d4f1"></i>
        <h1 class="mt-4">Success!</h1>
        <h2 style="color:#c6c8ca">
            <slot/>
        </h2>
    </div>
</template>

<script>
    export default {
        name: "success"
    }
</script>

<style scoped>
.success{
    color:#999;
    font-size:10rem;
}
</style>