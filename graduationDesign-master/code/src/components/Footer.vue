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
		height: 80px;
		background-color: #EEF1F6;
		position: absolute;
		left: 0px;
	}
	.container span {
		display: block;
		position: absolute;
		bottom: 10px;
		left: 10px;
		color: #999;
		font-weight: 500;
		font-size: 1.2em;
	}
</style>