// cypress/plugins/index.js

const fs = require('fs-extra')
const path = require('path')

/**
 * [processConfig] reads the configFile option and loads the required config
 * Defaults to development if not set on command line
 * ${URI_ROOT} must be set as <initials>.test
 * @param  {[type]} config [the original config object]
 * @return {[type]}        [return the modified config object]
 */
function processConfig(on, config) {
  const file = config.env.configFile || 'no_env_default'
  return getConfigurationByFile(file).then(function(file) {
    if (config.env.configFile === 'development') {
      if (!process.env.URI_ROOT) {
        throw new Error('URI_ROOT not set - export URI_ROOT=http://yourlocalhost.com');
      }
      // append the URI_ROOT to the baseUrl
      file.baseUrl = file.baseUrl + process.env.URI_ROOT
    }
    // always return the file object
    return file
  })
}
/**
 * [getConfigurationByFile]
 * @param  {[type]} file [specifies the filename for the env configFile]
 * @return {[type]}      [returns the files as a json object]
 */
function getConfigurationByFile(file) {
  const pathToConfigFile = path.resolve('cypress', 'config', `${file}.json`)
  return fs.readJson(pathToConfigFile)
}
/**
 * [exports]
 * @param  {} on     [on start]
 * @param  {} config [the original config object]
 * @return {}        [return the modified config object]
 */
module.exports = (on, config) => {
  return processConfig(on, config)
}