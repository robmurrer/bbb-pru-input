/* input.p 
    
    Waits for an input signal on P8.28
    Once signal goes high it turns on an LED attached to P8.29 for a moment 
    Rob Murrer - 2014-09-08
*/

.origin 0
.entrypoint START

#include "input.hp"

START:

    /* Enable OCP master port*/
    lbco    r0, CONST_PRUCFG, 4, 4
    clr     r0, r0, 4         /* Clear SYSCFG[STANDBY_INIT] to enable OCP master port*/
    sbco    r0, CONST_PRUCFG, 4, 4


    /* wait until input goes high */
    wbs     r31.t10
    
    /* turn on led P8.29 */
    set     r30.t9

    /* Delay for a few seconds */
    mov     r0, 0xFFFFFFF
DEL:
    sub     r0, r0, 1
    qbne    DEL, r0, 0
    
    /* turn off led */
    clr     r30.t9

    /* signal c program done */
    mov     r31.b0, PRU1_ARM_INTERRUPT+16

    halt 
