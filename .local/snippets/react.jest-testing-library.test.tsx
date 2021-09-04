import { render, screen } from '@testing-library/react';

import { Component } from './component';

describe('<Component />', () => {
	it('should render', () => {
		render(
			<Component
        key="value"
			/>
		);

		expect(screen.getAllByRole('radio', { checked: true })).toHaveLength(1);
	});
});
