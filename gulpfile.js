"use strict";

const gulp = require('gulp');
const jasmine = require('gulp-jasmine');
const istanbul = require('gulp-istanbul');
const SpecReporter = require('jasmine-spec-reporter');
const coveralls = require('gulp-coveralls');

let srcs = gulp.src('./index.js');
let all = gulp.src('./spec/*.js');

function buildCoverage() {
  return srcs
    .pipe(istanbul())
    .pipe(istanbul.hookRequire());
}

function runSpecs() {
  let spec;
  let toJasmine = jasmine({
    reporter: new SpecReporter({
      displayStackTrace: 'summary'
    })
  }); 

  spec = all.pipe(toJasmine)
    .pipe(istanbul.writeReports())
    .pipe(istanbul.enforceThresholds({
      thresholds: {global: 50}
    }));

  return spec.on('end', function () {
    if (process.env.NODE_ENV && process.env.NODE_ENV !== 'local') {
      return gulp.src('./coverage/lcov.info').pipe(coveralls());
    }
  }).on('error', function () {
    process.exit(1);
  });
}

gulp.task('buildCoverage', buildCoverage);
gulp.task('specs', ['buildCoverage'], runSpecs);
