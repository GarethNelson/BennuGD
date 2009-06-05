/*
 *  Copyright � 2006-2009 SplinterGU (Fenix/Bennugd)
 *
 *  This file is part of Bennu - Game Development
 *
 *  Bennu is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  Bennu is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
 *
 */

#ifndef __BITWISE_MAP_H
#define __BITWISE_MAP_H

#define bit_set(m,b)    (((uint32_t *)(m))[(b)>>5] |=   1<<((b)&0x1F))
#define bit_clr(m,b)    (((uint32_t *)(m))[(b)>>5] &= ~(1<<((b)&0x1F)))
#define bit_tst(m,b)    (((uint32_t *)(m))[(b)>>5] &   (1<<((b)&0x1F)))

#endif
