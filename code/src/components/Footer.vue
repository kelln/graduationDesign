<template>
	<div class="container">
		<span>www.tourwebsit.com.cn</span>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				color1: '#F00',
				color2: null,
				radio: 'Select'
			}
		}
	}
</script>

<style scoped>
	.container {
		width: 100%;
		height: 140px;
		background-color: #324057;
	}
	.container span {
		display: block;
		padding-top: 80px;
		padding-left: 10px;	
		color: #FFF;
		font-weight: 500;
		font-size: 1.2em;
	}
</style>