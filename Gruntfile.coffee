module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-mocha-test'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    clean:
      dist: [ 'dist' ]
    copy:
      dist:
        files: [
          { expand: true, cwd: 'src', src: 'index.d.ts', dest: 'dist/lib' }
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
    mochaTest:
      test:
        options:
          require: [
            'coffee-script/register'
          ]
          timeout: 30000
        src: [ 'test/**/*.coffee' ]
      coverage:
        options:
          reporter: 'html-cov'
          quiet: true
          captureFile: 'coverage.html'
          require: [
            'coffee-script/register',
            'coverage/blanket'
          ]
          timeout: 30000
        src: [ 'test/**/*.coffee' ]

  grunt.registerTask 'test', [ 'mochaTest:test' ]

  grunt.registerTask 'coverage', [ 'mochaTest:coverage' ]

  grunt.registerTask 'dist', [ 'coffee', 'copy' ]

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
