import type { FC } from "react"

type ComponentProps = {
  text?: string
}

const Component: FC<ComponentProps> = ({ text = undefined }) => {
  return <div>{text}</div>
}

export { Component }
export type { ComponentProps }
