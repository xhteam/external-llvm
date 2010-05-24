// RUN: llvm-mc -triple i386-unknown-unknown --show-encoding %s | FileCheck %s

	pause
// CHECK: pause
// CHECK: encoding: [0xf3,0x90]
	sfence
// CHECK: sfence
// CHECK: encoding: [0x0f,0xae,0xf8]
	lfence
// CHECK: lfence
// CHECK: encoding: [0x0f,0xae,0xe8]
	mfence
// CHECK: mfence
// CHECK: encoding: [0x0f,0xae,0xf0]
	monitor
// CHECK: monitor
// CHECK: encoding: [0x0f,0x01,0xc8]
	mwait
// CHECK: mwait
// CHECK: encoding: [0x0f,0x01,0xc9]

	vmcall
// CHECK: vmcall
// CHECK: encoding: [0x0f,0x01,0xc1]
	vmlaunch
// CHECK: vmlaunch
// CHECK: encoding: [0x0f,0x01,0xc2]
	vmresume
// CHECK: vmresume
// CHECK: encoding: [0x0f,0x01,0xc3]
	vmxoff
// CHECK: vmxoff
// CHECK: encoding: [0x0f,0x01,0xc4]
	swapgs
// CHECK: swapgs
// CHECK: encoding: [0x0f,0x01,0xf8]

rdtscp
// CHECK: rdtscp
// CHECK:  encoding: [0x0f,0x01,0xf9]


// CHECK: movl	%eax, 16(%ebp)          # encoding: [0x89,0x45,0x10]
	movl	%eax, 16(%ebp)
// CHECK: movl	%eax, -16(%ebp)          # encoding: [0x89,0x45,0xf0]
	movl	%eax, -16(%ebp)

// CHECK: testb	%bl, %cl                # encoding: [0x84,0xcb]
        testb %bl, %cl

// CHECK: cmpl	%eax, %ebx              # encoding: [0x39,0xc3]
        cmpl %eax, %ebx

// CHECK: addw	%ax, %ax                # encoding: [0x66,0x01,0xc0]
        addw %ax, %ax

// CHECK: shrl	%eax                    # encoding: [0xd1,0xe8]
        shrl $1, %eax

// moffset forms of moves, rdar://7947184
movb	0, %al    // CHECK: movb 0, %al  # encoding: [0xa0,A,A,A,A]
movw	0, %ax    // CHECK: movw 0, %ax  # encoding: [0x66,0xa1,A,A,A,A]
movl	0, %eax   // CHECK: movl 0, %eax  # encoding: [0xa1,A,A,A,A]

// rdar://7973775
into
// CHECK: into
// CHECK:  encoding: [0xce]
int3
// CHECK: int3
// CHECK:  encoding: [0xcc]
int $4
// CHECK: int $4
// CHECK:  encoding: [0xcd,0x04]
int $255
// CHECK: int $255
// CHECK:  encoding: [0xcd,0xff]

// CHECK: pushfl	# encoding: [0x9c]
        pushf
// CHECK: pushfl	# encoding: [0x9c]
        pushfl
// CHECK: popfl	        # encoding: [0x9d]
        popf
// CHECK: popfl	        # encoding: [0x9d]
        popfl

// rdar://8014869
retl
// CHECK: ret
// CHECK:  encoding: [0xc3]

// rdar://7973854
// CHECK: cmoval	%eax, %edx
// CHECK:  encoding: [0x0f,0x47,0xd0]
        	cmoval	%eax,%edx

// CHECK: cmovael	%eax, %edx
// CHECK:  encoding: [0x0f,0x43,0xd0]
        	cmovael	%eax,%edx

// CHECK: cmovbel	%eax, %edx
// CHECK:  encoding: [0x0f,0x46,0xd0]
        	cmovbel	%eax,%edx

// CHECK: cmovbl	%eax, %edx
// CHECK:  encoding: [0x0f,0x42,0xd0]
        	cmovbl	%eax,%edx

// CHECK: cmovbel	%eax, %edx
// CHECK:  encoding: [0x0f,0x46,0xd0]
        	cmovbel	%eax,%edx

// CHECK: cmovbl	%eax, %edx
// CHECK:  encoding: [0x0f,0x42,0xd0]
        	cmovcl	%eax,%edx

// CHECK: cmovel	%eax, %edx
// CHECK:  encoding: [0x0f,0x44,0xd0]
        	cmovel	%eax,%edx

// CHECK: cmovgl	%eax, %edx
// CHECK:  encoding: [0x0f,0x4f,0xd0]
        	cmovgl	%eax,%edx

// CHECK: cmovgel	%eax, %edx
// CHECK:  encoding: [0x0f,0x4d,0xd0]
        	cmovgel	%eax,%edx

// CHECK: cmovll	%eax, %edx
// CHECK:  encoding: [0x0f,0x4c,0xd0]
        	cmovll	%eax,%edx

// CHECK: cmovlel	%eax, %edx
// CHECK:  encoding: [0x0f,0x4e,0xd0]
        	cmovlel	%eax,%edx

// CHECK: cmovbel	%eax, %edx
// CHECK:  encoding: [0x0f,0x46,0xd0]
        	cmovnal	%eax,%edx

// CHECK: cmovnel	%eax, %edx
// CHECK:  encoding: [0x0f,0x45,0xd0]
        	cmovnel	%eax,%edx

// CHECK: cmovael	%eax, %edx
// CHECK:  encoding: [0x0f,0x43,0xd0]
        	cmovnbl	%eax,%edx

// CHECK: cmoval	%eax, %edx
// CHECK:  encoding: [0x0f,0x47,0xd0]
        	cmovnbel	%eax,%edx

// CHECK: cmovael	%eax, %edx
// CHECK:  encoding: [0x0f,0x43,0xd0]
        	cmovncl	%eax,%edx

// CHECK: cmovnel	%eax, %edx
// CHECK:  encoding: [0x0f,0x45,0xd0]
        	cmovnel	%eax,%edx

// CHECK: cmovlel	%eax, %edx
// CHECK:  encoding: [0x0f,0x4e,0xd0]
        	cmovngl	%eax,%edx

// CHECK: cmovgel	%eax, %edx
// CHECK:  encoding: [0x0f,0x4d,0xd0]
        	cmovnl	%eax,%edx

// CHECK: cmovnel	%eax, %edx
// CHECK:  encoding: [0x0f,0x45,0xd0]
        	cmovnel	%eax,%edx

// CHECK: cmovlel	%eax, %edx
// CHECK:  encoding: [0x0f,0x4e,0xd0]
        	cmovngl	%eax,%edx

// CHECK: cmovll	%eax, %edx
// CHECK:  encoding: [0x0f,0x4c,0xd0]
        	cmovngel	%eax,%edx

// CHECK: cmovgel	%eax, %edx
// CHECK:  encoding: [0x0f,0x4d,0xd0]
        	cmovnll	%eax,%edx

// CHECK: cmovgl	%eax, %edx
// CHECK:  encoding: [0x0f,0x4f,0xd0]
        	cmovnlel	%eax,%edx

// CHECK: cmovnol	%eax, %edx
// CHECK:  encoding: [0x0f,0x41,0xd0]
        	cmovnol	%eax,%edx

// CHECK: cmovnpl	%eax, %edx
// CHECK:  encoding: [0x0f,0x4b,0xd0]
        	cmovnpl	%eax,%edx

// CHECK: cmovnsl	%eax, %edx
// CHECK:  encoding: [0x0f,0x49,0xd0]
        	cmovnsl	%eax,%edx

// CHECK: cmovnel	%eax, %edx
// CHECK:  encoding: [0x0f,0x45,0xd0]
        	cmovnzl	%eax,%edx

// CHECK: cmovol	%eax, %edx
// CHECK:  encoding: [0x0f,0x40,0xd0]
        	cmovol	%eax,%edx

// CHECK: cmovpl	%eax, %edx
// CHECK:  encoding: [0x0f,0x4a,0xd0]
        	cmovpl	%eax,%edx

// CHECK: cmovsl	%eax, %edx
// CHECK:  encoding: [0x0f,0x48,0xd0]
        	cmovsl	%eax,%edx

// CHECK: cmovel	%eax, %edx
// CHECK:  encoding: [0x0f,0x44,0xd0]
        	cmovzl	%eax,%edx
