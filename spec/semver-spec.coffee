bumpVersion = require '..'

describe 'Bump SemVer number', () ->

  describe 'Bump version according to masks', () ->
    it 'Should bump PATCH', () ->
      expect(bumpVersion [0, 0, 1], '0.1.0').toBe '0.1.1'

    it 'Should bump MINOR', () ->
      expect(bumpVersion [0, 1, 0], '0.1.0').toBe '0.2.0'

    it 'Should bump MAJOR', () ->
      expect(bumpVersion [1, 0, 0], '0.1.0').toBe '1.0.0'

  describe 'If no MASKS are provided', () ->
    it 'Should bump PATCH', () ->
      expect(bumpVersion '1.3.5').toBe '1.3.6'

  describe 'If MASKS is [0, 0, 0]', () ->
    it 'Should bump PATCH', () ->
      expect(bumpVersion [0, 0, 0], '3.25.0').toBe '3.25.1'
