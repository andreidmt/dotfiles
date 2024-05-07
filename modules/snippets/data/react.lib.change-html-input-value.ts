/**
 * Change DOM Input "value" and also trigger React's "onChange" handler.
 *
 * See for more:
 * https://coryrylan.com/blog/trigger-input-updates-with-react-controlled-inputs
 *
 * @example
 * const ClearableInput = ({ value, onChange }) => {
 *   const ref = useRef(null);
 *
 *   // dont require a separate "onClear" props, the parent can decide
 *   // what to do based on the value
 *   const handleClear = () => {
 *     changeHTMLInputValue(ref.current, '')
 *   }
 *
 *   return (
 *     <>
 *       <input ref={ref} value={value} onChange={onChange}/>
 *       <button label="Clear" onClick={handleClear}/>
 *     </>
 *   )
 * }
 */

type ChangeHTMLInputValue = (input: HTMLInputElement, value: string) => void;

export const changeHTMLInputValue: ChangeHTMLInputValue = (input, value) => {
  Object.getOwnPropertyDescriptor(
    window.HTMLInputElement.prototype,
    "value"
  )?.set?.call(input, value);

  input.dispatchEvent(new Event("change", { bubbles: true }));
};
