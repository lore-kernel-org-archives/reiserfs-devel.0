From: <doiggl@velocitynet.com.au>
Subject: Re: Has anyone ever compiled the Reiser4 demo programs ?
Date: Mon, 08 Aug 2016 00:01:25 +1000
Message-ID: <4e57178c68f5bb2bb67392e472a02ede@mail.velocitynet.com.au>
References: <819f0d4abe0d44ecc88c935af00724a6@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <819f0d4abe0d44ecc88c935af00724a6@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Tried following,
What is next step ?
Thanks Glenn

# ll /tmp/reiser4progs-1.1.0/include/misc/misc.h
/tmp/reiser4progs-1.1.0/demos/busy.h
-rw-r--r-- 1 root users 1409 Jan  9  2009
/tmp/reiser4progs-1.1.0/demos/busy.h
-rw-r--r-- 1 root users 1873 Jan  9  2009
/tmp/reiser4progs-1.1.0/include/misc/misc.h

# gcc -I/tmp/reiser4progs-1.1.0/demos/  -I/tmp/reiser4progs-1.1.0/include/
ls.c
/usr/lib64/gcc/x86_64-suse-linux/4.8/../../../../lib64/crt1.o: In function
`_start':
/home/abuild/rpmbuild/BUILD/glibc-2.19/csu/../sysdeps/x86_64/start.S:118:
undefined reference to `main'
/tmp/ccquggTV.o: In function `ls_cmd':
ls.c:(.text+0x46): undefined reference to `aal_exception_throw'
ls.c:(.text+0x7a): undefined reference to `aal_exception_throw'
ls.c:(.text+0xb2): undefined reference to `reiser4_semantic_open'
ls.c:(.text+0xe4): undefined reference to `aal_exception_throw'
ls.c:(.text+0x117): undefined reference to `reiser4_print_key'
ls.c:(.text+0x14d): undefined reference to `reiser4_object_readdir'
ls.c:(.text+0x171): undefined reference to `reiser4_print_key'
ls.c:(.text+0x192): undefined reference to `reiser4_object_close'
collect2: error: ld returned 1 exit status

# which ld
/usr/bin/ld

# ld -v
GNU ld (GNU Binutils; openSUSE 13.1) 2.23.2

