import { useState, Dispatch, SetStateAction } from "react"

type UseHook = () => [string, Dispatch<SetStateAction<string>>]

const useHook: UseHook = () => {
  const [value, setValue] = useState<string>("")

  return [value, setValue]
}

export { useHook }
