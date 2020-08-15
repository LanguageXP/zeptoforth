\ Copyright (c) 2013? Matthias Koch
\ Copyright (c) 2020 Travis Bemann
\
\ This program is free software: you can redistribute it and/or modify
\ it under the terms of the GNU General Public License as published by
\ the Free Software Foundation, either version 3 of the License, or
\ (at your option) any later version.
\
\ This program is distributed in the hope that it will be useful,
\ but WITHOUT ANY WARRANTY; without even the implied warranty of
\ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
\ GNU General Public License for more details.
\
\ You should have received a copy of the GNU General Public License
\ along with this program.  If not, see <http://www.gnu.org/licenses/>.

\ Compile to flash
compile-to-flash

\ Set up the wordlist
forth-wordlist 1 set-order
forth-wordlist set-current
wordlist constant led-wordlist
forth-wordlist led-wordlist 2 set-order
led-wordlist set-current

\ Registers
$40021000        constant RCC_BASE
$4C RCC_BASE or  constant RCC_AHB2ENR
$48000000        constant GPIOA
: gpio-port  ( n -- a ) #10 lshift GPIOA or ;
GPIOA   0 or     constant GPIOA_MODER
GPIOA $10 or     constant GPIOA_IDR
GPIOA  $C or     constant GPIOA_PUPD
1 gpio-port      constant GPIOB
4 gpio-port      constant GPIOE
$18 GPIOB or     constant GPIOB_BSRR
$18 GPIOE or     constant GPIOE_BSRR

\ Initialize the LEDs
: led-init  ( -- )                           \ initialize the leds
  1 1 lshift RCC_AHB2ENR bis!                \ enable clock on gpio port B
  1 4 lshift RCC_AHB2ENR bis!                \ enable clock on gpio port E
  3 4 lshift GPIOB bic!                      \ PB2 output
  1 4 lshift GPIOB bis!                      \ PB2 output
  3 16 lshift GPIOE bic!                     \ PE8 output
  1 16 lshift GPIOE bis!                     \ PE8 output
;

\ Turn the red LED on
: led-red-on  ( -- )
  1 2 lshift GPIOB_BSRR !
;

\ Turn the red LED off
: led-red-off  ( -- )
  1 2 16 + lshift GPIOB_BSRR !
;

\ Turn the green LED on
: led-green-on  ( -- )
  1 8 lshift GPIOE_BSRR !
;

\ Turn the green LED offd
: led-green-off  ( -- )
  1 8 16 + lshift GPIOE_BSRR !
;

\ Init
: init ( -- )
  init
  led-init
;

\ Warm reboot
warm
