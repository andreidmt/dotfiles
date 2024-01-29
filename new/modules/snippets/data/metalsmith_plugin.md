```toml
id="897b9a13-9438-4a48-a2b4-18313128458e"
type="snippet"
description="Metalsmith plugin template"
tags=["javascript", "metalsmith", "plugin"]
createdAt="2023-11-28T08:12:38+01:00"
```

```javascript
/** @typedef {import('metalsmith').Plugin} MetalPlugin */
/** @typedef {import('metalsmith').File} MetalFile */
/** @typedef {import('metalsmith').Debugger} MetalDebugger */

/**
 * @typedef {object} MetalPluginOptions
 * @property {string[]} [pattern]
 */

/**
 * @param {MetalPluginOptions} [options]
 * @returns {MetalPlugin}
 */
const metalPlugin =
  ({ pattern = ["**/*.js", "*.js"] } = {}) =>
  async (files, metalsmith) => {
    const metalFiles = metalsmith.match(pattern, Object.keys(files))
    const debug = metalsmith.debug("metalPlugin")

    debug(`Found ${metalFiles.length} JS files under ${pattern}`)

    // Write files Promise.all to parallelize vs for-loop sequential
    const fileToParsePromises = metalFiles.map(async relativeFilePath => {
      const metalFile = /** @type {MetalFile} */ (files[relativeFilePath])

      debug(`Compiling ${relativeFilePath}`)
    })

    await Promise.all(fileToParsePromises)
  }

export { metalPlugin }
```
