<template>
	<div class='content'>
		<carousel></carousel>
		<h1>Welcome To This Web</h1>
		<!-- <search></search> -->
		<tabs></tabs>
		<!-- <pagniation></pagniation> -->
	</div>
</template>

<script>
	import Search from '../Search'
	import Carousel from '../Carousel'
	// import Pagniation from '../Pagniation'
	import Tabs from '../tabs.vue'

	export default {
		components: {
			'search': Search,
			'carousel': Carousel,
			// 'pagniation': Pagniation,
			'tabs': Tabs
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