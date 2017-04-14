<template>
	<div class='content'>
		<carousel></carousel>
		<h1>Welcome To This Web</h1>
		<search></search>
	</div>
</template>

<script>
	import Search from '../components/Search'
	import Carousel from '../components/Carousel'

	export default {
		components: {
			'search': Search,
			'carousel': Carousel
		}
	}
</script>

<style scoped>
	.content {
		width: 80%;
		text-align: center;
		margin: 0 auto;
	}
	h1 {
		color: #999;
		font-weight: 700;
	}
</style>