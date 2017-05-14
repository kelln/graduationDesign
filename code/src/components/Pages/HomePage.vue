<template>
	<div class='content'>
		<carousel></carousel>
		<h1>Welcome To This Web</h1>
		<search></search>
		<pagniation></pagniation>
	</div>
</template>

<script>
	import Search from '../Search'
	import Carousel from '../Carousel'
	import Pagniation from '../Pagniation'

	export default {
		components: {
			'search': Search,
			'carousel': Carousel,
			'pagniation': Pagniation
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