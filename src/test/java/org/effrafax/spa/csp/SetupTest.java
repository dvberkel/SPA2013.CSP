package org.effrafax.spa.csp;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class SetupTest {

	@Test
	public void shouldRunTests() {
		assertTrue(true);
	}

	@Test
	public void shouldReferenceSources() {
		assertEquals("SPA 2013", Conference.name());
	}

}
