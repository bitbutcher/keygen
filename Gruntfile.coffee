module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    clean:
      dist: [ 'dist' ] 
    copy:
      dist:
        files: [
          { expand: true, src: 'LICENSE-MIT', dest: 'dist' }
          { expand: true, src: 'package.json', dest: 'dist' }
          { expand: true, src: 'README.md', dest: 'dist' }
        ]
    coffee:
      compile:
        expand: true
        cwd: 'src'
        src: '**/*.coffee'
        dest: 'dist/lib'
        ext: '.js'

  grunt.registerTask 'dist', [ 'copy', 'coffee' ]

  spawn = (cmd, cwd, args..., done) ->
    proc = grunt.util.spawn {cmd, args, opts: {cwd}}, (err) ->
      done not err?
    proc.stdout.pipe process.stdout
    proc.stderr.pipe process.stderr

  grunt.registerTask 'link', ->
    grunt.task.requires 'dist'
    spawn 'npm', 'dist', 'link', @async()

  grunt.registerTask 'publish', ->
    grunt.task.requires 'dist'
    spawn 'npm', 'dist', 'publish', @async()

  grunt.registerTask 'default', ['clean', 'dist']
