
<template>
<div>
<p>{{ total }}</p>
<button @click="increment">Increment</button>
</div>
</template>

<script>
import { ref } from 'vue'


export default defineComponent({
    setup() {
        const total = ref(0)
        const increment = () => {
      count.value++;
    };
        return {
            count,
            increment,
            message: "hello from main page"
        };
    },
})
</script>

<style>
</style>