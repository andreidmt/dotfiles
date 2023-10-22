```toml
id="15abe7c9-aa45-4e5d-b6e4-43184026bbc1"
type="snippet"
tags=["javascript", "nodejs", "dotenv", "environment"]
createdAt="2023-06-19T09:10:27+02:00"
```
# Environment variables

Accessing environment variables in Node.js can be done simply by using
`process.env`.

## Issue #1: Type safety

While it is convenient to use packages like `dotenv` to load environment
variables from a file, the major problem with using them in your app is that
they are not type-safe, having either explicitly check for their existence or
use a `as` cast.

## Issue #2: Import order

Due to the nature of how ESM imports works, it's best to set the environment
variable logic, including the `dontenv` initialization, in a separate file and
import it in your app's entry point.

This is also explained in the `dotenv` docs - https://github.com/motdotla/dotenv#how-do-i-use-dotenv-with-import

For example:

```js
// errorReporter.js
import { Client } from 'best-error-reporting-service'

export default new Client(process.env.API_KEY)

// index.js
import * as dotenv from 'dotenv'
dotenv.config()

import errorReporter from './errorReporter.js'
errorReporter.report(new Error('documented example'))
```

This does not work as expected and `process.env.API_KEY` is blank. This is
because Node.js will first load all the imports, in a depth-first order, and
then execute the code in the `index.js` file. This means that `dotenv.config()`
will _run after_ the code inside the `errorReporter.js`.

But putting all the initialization logic in a separate file and importing it
will work as expected:

```js
import "./config.environment.js"
import errorReporter from './errorReporter.mjs'
errorReporter.report(new Error('documented example'))
```

## Required packages

```sh
npm install dotenv dotenv-expand
```

## Example

In this example, we're clearly setting the default values for app level
environment variables and providing a type-safe way to access them via the
`getEnvironmentVariable` functions.

```ts
import { join, resolve } from "node:path"
import dotenv from "dotenv"
import dotenvExpand from "dotenv-expand"

dotenvExpand.expand(
  dotenv.config({
    path: resolve(".z3r0bootrc"),
  })
)

const DEFAULTS = {
  ZB_HOME: ".z3r0boot",
  ZB_IGNORE_FILE: ".gitignore",
  ZB_DATABASE_HOME: join(".z3r0boot", "db"),
  ZB_STATE_HOME: join(".z3r0boot", "state"),
} as const

Object.entries(DEFAULTS).forEach(([key, value]) => {
  process.env[key] = process.env[key] ?? value
})

/**
 * Returns the value of the environment variable or throws an error if it does
 * not exist.
 * @param {keyof typeof DEFAULTS} key
 * @returns {string}
 */
export const getEnvironmentVariable = (key) => {
  const value = process.env[key]

  if (value === undefined) {
    throw new Error(`Missing environment variable: ${key}`)
  }

  return value
}
```
