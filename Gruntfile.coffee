module.exports = (grunt) ->

  grunt.initConfig
    browserify:
      options:
        extensions: ['.coffee']
        transform: ['coffeeify', 'uglifyify']
        debug: true

      dist:
        files:
          'assets/index.js': ['./client/index.coffee'],

    watch:
      changes:
        files: ['client/**/*']
        tasks: ['assets']

    copy:
      dist:
        files: [
          expand: true
          cwd: './client/images/'
          src: ['**/*']
          dest: 'assets/images/'
        ]

    compass:
      dist:
        options:
          sassDir: 'client/stylesheets/'
          cssDir: 'assets/'
          require: ['susy', 'breakpoint']

    express:
      dev:
        options:
          port: 8080
          hostname: 'localhost'
          open: true
          server: './server'


  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-browserify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.loadNpmTasks('grunt-express')

  grunt.registerTask('default', ['express', 'watch'])
  grunt.registerTask('assets', ['browserify', 'compass', 'copy'])

