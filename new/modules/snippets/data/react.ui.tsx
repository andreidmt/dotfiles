import { FC, memo } from 'react';

const debug = require('debug')('namespace:core.ui/ui');

type UIPropsType = {
	text?: string;
};

export const UI: FC<UIPropsType> = memo(({ text }) => {
	debug({ text });

	return <div>{text}</div>;
});
