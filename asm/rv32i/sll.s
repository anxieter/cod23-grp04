_start:
beq x0, x0, reset_vector

loop:
beq x0, x0, loop

fail:
lui t0, 0x10000
lb t1, 5(t0)
andi t1, t1, 0x20
beq t1, zero, fail
addi a0, zero, 'F'
sb a0, 0(t0)
beq x0, x0, loop

pass:
lui t0, 0x10000
lb t1, 5(t0)
andi t1, t1, 0x20
beq t1, zero, pass
addi a0, zero, 'P'
sb a0, 0(t0)
beq x0, x0, loop

nop
nop
nop

reset_vector:
li	ra,0
li	sp,0
li	gp,0
li	tp,0
li	t0,0
li	t1,0
li	t2,0
li	s0,0
li	s1,0
li	a0,0
li	a1,0
li	a2,0
li	a3,0
li	a4,0
li	a5,0
li	a6,0
li	a7,0
li	s2,0
li	s3,0
li	s4,0
li	s5,0
li	s6,0
li	s7,0
li	s8,0
li	s9,0
li	s10,0
li	s11,0
li	t3,0
li	t4,0
li	t5,0
li	t6,0

test_2:
li	gp,2
li	ra,1
li	sp,0
sll	a4,ra,sp
li	t2,1
bne	a4,t2,fail

test_3:
li	gp,3
li	ra,1
li	sp,1
sll	a4,ra,sp
li	t2,2
bne	a4,t2,fail

test_4:
li	gp,4
li	ra,1
li	sp,7
sll	a4,ra,sp
li	t2,128
bne	a4,t2,fail

test_5:
li	gp,5
li	ra,1
li	sp,14
sll	a4,ra,sp
lui	t2,0x4
bne	a4,t2,fail

test_6:
li	gp,6
li	ra,1
li	sp,31
sll	a4,ra,sp
lui	t2,0x80000
bne	a4,t2,fail

test_7:
li	gp,7
li	ra,-1
li	sp,0
sll	a4,ra,sp
li	t2,-1
bne	a4,t2,fail

test_8:
li	gp,8
li	ra,-1
li	sp,1
sll	a4,ra,sp
li	t2,-2
bne	a4,t2,fail

test_9:
li	gp,9
li	ra,-1
li	sp,7
sll	a4,ra,sp
li	t2,-128
bne	a4,t2,fail

test_10:
li	gp,10
li	ra,-1
li	sp,14
sll	a4,ra,sp
lui	t2,0xffffc
bne	a4,t2,fail

test_11:
li	gp,11
li	ra,-1
li	sp,31
sll	a4,ra,sp
lui	t2,0x80000
bne	a4,t2,fail

test_12:
li	gp,12
lui	ra,0x21212
addi	ra,ra,289 # _start-0x5edededf
li	sp,0
sll	a4,ra,sp
lui	t2,0x21212
addi	t2,t2,289 # _start-0x5edededf
bne	a4,t2,fail

test_13:
li	gp,13
lui	ra,0x21212
addi	ra,ra,289 # _start-0x5edededf
li	sp,1
sll	a4,ra,sp
lui	t2,0x42424
addi	t2,t2,578 # _start-0x3dbdbdbe
bne	a4,t2,fail

test_14:
li	gp,14
lui	ra,0x21212
addi	ra,ra,289 # _start-0x5edededf
li	sp,7
sll	a4,ra,sp
lui	t2,0x90909
addi	t2,t2,128 # _end+0x10907080
bne	a4,t2,fail

test_15:
li	gp,15
lui	ra,0x21212
addi	ra,ra,289 # _start-0x5edededf
li	sp,14
sll	a4,ra,sp
lui	t2,0x48484
bne	a4,t2,fail

test_16:
li	gp,16
lui	ra,0x21212
addi	ra,ra,289 # _start-0x5edededf
li	sp,31
sll	a4,ra,sp
lui	t2,0x80000
bne	a4,t2,fail

test_17:
li	gp,17
lui	ra,0x21212
addi	ra,ra,289 # _start-0x5edededf
li	sp,-64
sll	a4,ra,sp
lui	t2,0x21212
addi	t2,t2,289 # _start-0x5edededf
bne	a4,t2,fail

test_18:
li	gp,18
lui	ra,0x21212
addi	ra,ra,289 # _start-0x5edededf
li	sp,-63
sll	a4,ra,sp
lui	t2,0x42424
addi	t2,t2,578 # _start-0x3dbdbdbe
bne	a4,t2,fail

test_19:
li	gp,19
lui	ra,0x21212
addi	ra,ra,289 # _start-0x5edededf
li	sp,-57
sll	a4,ra,sp
lui	t2,0x90909
addi	t2,t2,128 # _end+0x10907080
bne	a4,t2,fail

test_20:
li	gp,20
lui	ra,0x21212
addi	ra,ra,289 # _start-0x5edededf
li	sp,-50
sll	a4,ra,sp
lui	t2,0x48484
bne	a4,t2,fail

test_22:
li	gp,22
li	ra,1
li	sp,7
sll	ra,ra,sp
li	t2,128
bne	ra,t2,fail

test_23:
li	gp,23
li	ra,1
li	sp,14
sll	sp,ra,sp
lui	t2,0x4
bne	sp,t2,fail

test_24:
li	gp,24
li	ra,3
sll	ra,ra,ra
li	t2,24
bne	ra,t2,fail

test_25:
li	gp,25
li	tp,0
li	ra,1
li	sp,7
sll	a4,ra,sp
mv	t1,a4
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_25+0x8
li	t2,128
bne	t1,t2,fail

test_26:
li	gp,26
li	tp,0
li	ra,1
li	sp,14
sll	a4,ra,sp
nop
mv	t1,a4
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_26+0x8
lui	t2,0x4
bne	t1,t2,fail

test_27:
li	gp,27
li	tp,0
li	ra,1
li	sp,31
sll	a4,ra,sp
nop
nop
mv	t1,a4
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_27+0x8
lui	t2,0x80000
bne	t1,t2,fail

test_28:
li	gp,28
li	tp,0
li	ra,1
li	sp,7
sll	a4,ra,sp
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_28+0x8
li	t2,128
bne	a4,t2,fail

test_29:
li	gp,29
li	tp,0
li	ra,1
li	sp,14
nop
sll	a4,ra,sp
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_29+0x8
lui	t2,0x4
bne	a4,t2,fail

test_30:
li	gp,30
li	tp,0
li	ra,1
li	sp,31
nop
nop
sll	a4,ra,sp
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_30+0x8
lui	t2,0x80000
bne	a4,t2,fail

test_31:
li	gp,31
li	tp,0
li	ra,1
nop
li	sp,7
sll	a4,ra,sp
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_31+0x8
li	t2,128
bne	a4,t2,fail

test_32:
li	gp,32
li	tp,0
li	ra,1
nop
li	sp,14
nop
sll	a4,ra,sp
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_32+0x8
lui	t2,0x4
bne	a4,t2,fail

test_33:
li	gp,33
li	tp,0
li	ra,1
nop
nop
li	sp,31
sll	a4,ra,sp
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_33+0x8
lui	t2,0x80000
bne	a4,t2,fail

test_34:
li	gp,34
li	tp,0
li	sp,7
li	ra,1
sll	a4,ra,sp
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_34+0x8
li	t2,128
bne	a4,t2,fail

test_35:
li	gp,35
li	tp,0
li	sp,14
li	ra,1
nop
sll	a4,ra,sp
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_35+0x8
lui	t2,0x4
bne	a4,t2,fail

test_36:
li	gp,36
li	tp,0
li	sp,31
li	ra,1
nop
nop
sll	a4,ra,sp
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_36+0x8
lui	t2,0x80000
bne	a4,t2,fail

test_37:
li	gp,37
li	tp,0
li	sp,7
nop
li	ra,1
sll	a4,ra,sp
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_37+0x8
li	t2,128
bne	a4,t2,fail

test_38:
li	gp,38
li	tp,0
li	sp,14
nop
li	ra,1
nop
sll	a4,ra,sp
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_38+0x8
lui	t2,0x4
bne	a4,t2,fail

test_39:
li	gp,39
li	tp,0
li	sp,31
nop
nop
li	ra,1
sll	a4,ra,sp
addi	tp,tp,1 # _start-0x7fffffff
li	t0,2
bne	tp,t0,test_39+0x8
lui	t2,0x80000
bne	a4,t2,fail

test_40:
li	gp,40
li	ra,15
sll	sp,zero,ra
li	t2,0
bne	sp,t2,fail

test_41:
li	gp,41
li	ra,32
sll	sp,ra,zero
li	t2,32
bne	sp,t2,fail

test_42:
li	gp,42
sll	ra,zero,zero
li	t2,0
bne	ra,t2,fail

test_43:
li	gp,43
li	ra,1024
lui	sp,0x1
addi	sp,sp,-2048 # _start-0x7ffff800
sll	zero,ra,sp
li	t2,0
bne	zero,t2,fail
bne	zero,gp,pass
