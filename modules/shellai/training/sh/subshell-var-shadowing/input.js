import fs from 'node:fs'

const prompt_script = fs.readFileSync('./prompt_script', 'utf8')

const prompt = `I have a shell script designed for rudimentary load testing of HTTP servers. The script sends concurrent HTTP requests to a specified URL and increments counters for successful and failed requests. However, I'm encountering an issue where the counters for successful (\`REQ_SUCCESS_COUNT\`) and failed requests (\`REQ_FAIL_COUNT\`) remain zero even after processing the requests. Here's a relevant snippet from the script:

\`\`\`sh
${prompt_script}
\`\`\`

And the output of the script is as follows:

[Insert script output here]

Why are \`REQ_SUCCESS_COUNT\` and \`REQ_FAIL_COUNT\` not updating correctly, and how can I fix this issue?`

const completion = `The issue with your \`REQ_SUCCESS_COUNT\` and \`REQ_FAIL_COUNT\` variables remaining zero seems to stem from how the \`send_concurrent_requests\` function is called. 
When you use the command substitution \`$(send_concurrent_requests)\`, the function is executed in a subshell. Changes made to variables inside a subshell do not affect the variables in the parent shell, which is why the counters are reset for each batch.

To fix this, execute the \`send_concurrent_requests\` function directly without command substitution. This ensures it runs in the current shell, and any modifications to the variables are retained. Here's the adjusted part of your script:

[Insert adjusted script snippet here]

After this change, \`REQ_SUCCESS_COUNT\` and \`REQ_FAIL_COUNT\` should correctly accumulate counts across batches as they won't be reset by a subshell.`

export default {
  "prompt":  prompt, 
  "completion": completion
}
