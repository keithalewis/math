// ga.h - Grassmann Algebra library header file
#pragma once
#include <bitset>
#include <unordered_map>

namespace ga
{
	template<size_t n>
	using blade = std::bitset<n>; // Bitmasks for basis blades.
	
	template<size_t n, typename X = double>
	using G = std::unordered_map<blade<n>, X>; // Grassmann algebra element.

	// return sign and resulting blade of the geometric product of two basis blades
	template<size_t n>
	constexpr std::pair<bool, blade<n>> product(blade<n> I, blade<n> J)
	{
		bool sign = false;

		if ((I & J).any()) {
			return { sign, blade<n>{} }; // e_i^2 = 0
		}

		blade<n> IJ = I | J; // XOR to combine basis blades
		// Count the number of swaps needed to order the basis blades
		for (size_t i = 0, j = 0; i < n and j < n;	)
		{
			if (i < j) {
				++i;
			}
			else {
				sign |= (n - i)%2;
				++j;
			}
		}

		return {sign, IJ}	; // Return the resulting blade with sign
	}
	constexpr auto e1 = blade<3>(0b001); // e1
	constexpr auto e2 = blade<3>(0b010); // e2
	constexpr auto e12 = product(e1, e2);
	constexpr auto e21 = product(e2, e1); // should be negative of e12	

} // namespace ga
