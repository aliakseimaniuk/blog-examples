var gulp =            require('gulp'),
    browserSync =     require('browser-sync').create(),
    sass =            require('gulp-sass'),
    uglify =          require('gulp-uglify'),
    autoprefixer =    require('gulp-autoprefixer'),
    cleanCSS =        require('gulp-clean-css'),
    imagemin =        require('gulp-imagemin'),
    nunjucksRender =  require('gulp-nunjucks-render'),
    concat =          require('gulp-concat'),
    htmlmin =         require('gulp-htmlmin');

// Static Server + watching scss/html files.
gulp.task('serve', ['sass', 'nunjucks-html-watch'], function() {
    browserSync.init({
        server: './build'
    });

    gulp.watch('css/dev/*.scss', ['sass']);
    gulp.watch('./**/*.html', ['nunjucks-html-watch'])
});

gulp.task('sass', function() {
    return gulp.src('css/style.scss')
        .pipe(sass())
        .pipe(autoprefixer({
            browsers: ['last 2 versions'],
            cascade: false
        }))
        .pipe(cleanCSS())
        .pipe(gulp.dest('./build/css'))
        .pipe(browserSync.stream());
});

gulp.task('compressJs', function () {
    return gulp.src('js/*.js')
        .pipe(uglify())
        .pipe(gulp.dest('build/js'))
});

gulp.task('compressImage', function () {
    return gulp.src('img/**')
        .pipe(imagemin({
            progressive: true,
            optimizationLevel: 3
        }))
        .pipe(gulp.dest('build/img'))
});

gulp.task('nunjucks', function() {
  return gulp.src('pages/**/*.+(html|nunjucks)')
    .pipe(nunjucksRender({
      path: ['templates']
    }))
    .pipe(htmlmin(
      {
        collapseWhitespace: true,
        removeComments: true
      }))
    .pipe(gulp.dest('build'))
});

// Create a task that ensures the `nunjucks` task is complete before reloading browsers.
gulp.task('nunjucks-html-watch', ['nunjucks'], function () {
  browserSync.reload();
});

gulp.task('vendors-scripts', function() {
  return gulp.src([
      './node_modules/jquery/dist/jquery.min.js'])
    .pipe(concat('vendors.js'))
    .pipe(gulp.dest('build/js/'));
});

gulp.task('copy-files', function() {
  gulp.src([
    'config/web.config'
  ])
  .pipe(gulp.dest('build'));
});

// Compile project.
gulp.task('build-project', ['sass', 'compressImage', 'compressJs', 'nunjucks', 'vendors-scripts', 'copy-files']);

// Compile and start project.
gulp.task('default', ['build-project', 'serve']);
