```toml
id="c6b85962-b821-4f73-a28e-8bd8898d1fe4"
type="snippet"
description="React hook/context/provider pattern for Metalsmith metadata"
tags=["javascript", "react", "metalsmith", "context", "hook", "jsdoc"]
createdAt="2023-11-28T15:28:49+01:00"
```

```js
/** @typedef {import("react").ReactElement} ReactElement */
/** @typedef {import("react").ReactNode} ReactNode */

import { useContext, createContext, createElement } from "react"

const metalsmithContext = createContext({})

/**
 * MetalsmithProvider component. Wraps the entire app in a Metalsmith context
 * to provide access to the Metalsmith metadata.
 *
 * @param {Object}              props
 * @param {Record<string, any>} props.metadata
 * @param {ReactNode}           props.children
 * @returns {ReactElement} The MetalsmithProvider component
 *
 * @example
 * import { MetalsmithProvider } from "./use-metalsmith.js"
 *
 * const metadata = {
 *   title: "My Site",
 *   description: "My site's description",
 *   url: "https://example.com",
 *   generator: "Metalsmith + React",
 * }
 *
 * export const App = () => (
 *  <MetalsmithProvider metadata={metadata}>
 *     <MyApp />
 *   </MetalsmithProvider>
 * )
 */
export const MetalsmithProvider = ({ metadata, children }) =>
  createElement(metalsmithContext.Provider, { value: metadata }, children)

/**
 * Metalsmith metadata hook. Access the Metalsmith metadata from any component
 * in the app.
 *
 * @returns {Object} The Metalsmith context value
 *
 * @example
 * import { useMetalsmith } from "./use-metalsmith.js"
 *
 * export const MyComponent = () => {
 *   const { title } = useMetalsmith()
 *
 *   return <div>{title}</div>
 * }
 */
export const useMetalsmith = () => useContext(metalsmithContext)
```
