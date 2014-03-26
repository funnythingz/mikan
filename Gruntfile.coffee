module.exports = (grunt)->

  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-copy')

  grunt.registerTask('default', ['clean', 'compass'])
  grunt.registerTask('preview', ['clean', 'compass', 'copy', 'connect'])

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')

    compass:
      dist:
        options:
          config: 'config.rb'

    watch:
      css:
        files: ['scss/**/*.scss']
        tasks: ['compass']
        options:
          atBegin: true

    clean: ['preview/**/*.*']

    copy:
      html:
        files: [{
          expand: true
          cwd: 'src/'
          src: ['html/**/*.html']
          dest: 'preview/'
        }]

      assets:
        files: [{
          expand: true
          cwd: 'assets/'
          src: ['imgs/**/*.*']
          dest: 'preview/'
        }]

    connect:
      server:
        options:
          port: 8000
          base: 'preview'
          keepalive: true

  })
