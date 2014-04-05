module.exports = {
	options: {
		// Task-specific options go here.
	},
	dev: {
		expand: true,
		cwd: 'code/dev/',
		ext: '.html',
		src: ['*.html'],
		dest: 'code/dev/'
	}
};
