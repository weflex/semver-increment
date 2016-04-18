semver = require 'semver-utils'
fs     = require 'fs'


# Bump semantic version (SemVer) number in package.json according to
# MASKS. MASKS is an array composed of three digits, e.g. [0, 1, 0]. The topmost
# (left-most) nonzero bit of SemVer number is bumped (incremented) and the lower
# bits are set to zeros.
#
# @arguments
#   - masks: Array[Number]
#
# @returns
#   null
# 
bumpVersion = (masks) ->
