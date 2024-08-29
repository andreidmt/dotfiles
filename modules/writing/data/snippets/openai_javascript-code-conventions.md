```toml
id="c1acd4fe-a82b-4dcb-bfd9-4633570f3e4f"
type="snippet"
description="JavaScript code conventions when prompting OpenAI"
tags=["openai", "javascript", "code-conventions", "typescript", "jsdoc"]
createdAt="2023-05-02T21:26:50+02:00"
```

When writing JavaScript, TypeScript code, use the following rules:

- When interpolating a variable, use template literals
- When echoing an error message, use `console.error`
- Use `undefined` instead of `null`
- Use arrow functions unless `this` or `arguments` is needed
- Always generate JSDoc comments for functions
- When writing JSDoc, use `@name`, `@param`, `@returns`, `@example` and `@see`
  as needed
- When writing JSDoc, use the same parameter names as the function signature
- Write Typescript type separately where possible
- Use `describe` and `test` as Jest primitives and formulate the test title
  using the `given [ $CONTEXT ], [ $DO-ACTION ] should [ $EXPECT-RESULT ]`
  pattern
- When possible, dont nest if-statements, use early returns instead or guard
  clauses

## When to extract into variables

Dont create intermediary variables that are not used more than once except when
the variable name makes the code more readable.

Example of **incorrect** code:

```javascript 
response.on("end", () => { 
  try {
    const parsedData = JSON.parse(data)
    resolve(parsedData) 
  } catch (error) { 
    reject(error) 
  }
})
```

There is no need to create a variable for `JSON.parse(data)` since the variable
is not used more than once and the function name is descriptive enough, it
literally contains the words "parse" and "data" :)

Example of **correct** code:
