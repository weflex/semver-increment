semver = require 'semver-utils'
bumpVersion = require '..'

describe 'Bump SemVer number', () ->

  describe 'Bump version according to masks', () ->

    describe 'bump PATCH', () ->
      version = semver.parse (bumpVersion [0, 0, 1], '0.1.0')

      it 'Should bump PATCH', () ->
        expect(version.patch).toBe '1'

      it 'Should not bump MINOR', () ->
        expect(version.minor).toBe '1'

      it 'Should not bump MAJOR', () ->
        expect(version.major).toBe '0'


    describe 'bump MINOR', () ->
      version = semver.parse (bumpVersion [0, 1, 0], '12.0.3')

      it 'Should reset PATCH to zero', () ->
        expect(version.patch).toBe '0'

      it 'Should bump MINOR', () ->
        expect(version.minor).toBe '1'

      it 'Should not bump MAJOR', () ->
        expect(version.major).toBe '12'


    describe 'bump MAJOR', () ->
      version = semver.parse (bumpVersion [1, 0, 0], '1.20.3')

      it 'Should reset PATCH to zero', () ->
        expect(version.patch).toBe '0'

      it 'Should reset MINOR to zero', () ->
        expect(version.minor).toBe '0'

      it 'Should bump MAJOR', () ->
        expect(version.major).toBe '2'
      

  describe 'If no MASKS are provided', () ->
    version = semver.parse (bumpVersion '1.3.5')
    
    it 'Should bump PATCH', () ->
      expect(version.patch).toBe '6'

    it 'Should not bump MINOR', () ->
      expect(version.minor).toBe '3'

    it 'Should not bump MAJOR', () ->
      expect(version.major).toBe '1'


  describe 'If MASKS is [0, 0, 0]', () ->
    version = semver.parse (bumpVersion [0, 0, 0], '3.25.0')
    
    it 'Should bump PATCH', () ->
      expect(version.patch).toBe '1'

    it 'Should not bump MINOR', () ->
      expect(version.minor).toBe '25'

    it 'Should not bump MAJOR', () ->
      expect(version.major).toBe '3'
