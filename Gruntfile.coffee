module.exports = (grunt)->

  require('load-grunt-tasks')(grunt)

  grunt.registerTask('default', ['clean', 'compass', 'copy'])
  grunt.registerTask('preview', ['clean', 'compass', 'copy', 'connect'])

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')

    compass:
      dist:
        options:
          config: 'config.rb'

    watch:
      css:
        files: ['src/scss/**/*.scss']
        tasks: ['compass']
        options:
          atBegin: true

      html:
        files: ['src/html/**/*.html']
        tasks: ['copy:html']
        options:
          atBegin: true

    clean: ['build/**/*.*']

    copy:
      html:
        files: [{
          expand: true
          cwd: 'src/html/'
          src: ['**/*.html']
          dest: 'build/'
        }]

      assets:
        files: [{
          expand: true
          cwd: 'assets/'
          src: ['imgs/**/*.*']
          dest: 'build/'
        }]

    connect:
      server:
        options:
          hostname: "*"
          port: 8000
          base: 'build'
          keepalive: true

  })
