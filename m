From: Chris Wakefield <c_wakefield@shaw.ca>
Subject: grub reiser4 won't compile
Date: Wed, 27 Apr 2005 22:26:48 -0700
Message-ID: <200504272226.48234.c_wakefield@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23934-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Greetings all.

I'm attempting to setup Reiser4 on a partition and I've got as far as trying 
to compiling grub and I've run into a wall.

It's a Reiser4 patched grub source from:
ftp://ftp.namesys.com/pub/reiser4progs/grub/LATEST_PATCH
anyways, I run configure and I get:

"....checking build system type... x86_64-unknown-linux-gnu
checking host system type... x86_64-unknown-linux-gnu...

.........................

........"checking for C compiler default output file name... configure: error: 
C compiler cannot create executables".

config log error is:
......."configure:2416: $? = 1
configure: failed program was: | /* confdefs.h.  */" ......

This is happening only with reiser4 grub, as I'm able to compile kernels and 
who knows what else .. it's just this source only.
Do I require a different source or do I have to compile reiser4 grub in a 32 
bit chroot environment?

Can someone give me some ideas as to what it is needed here?

Thanks,
Chris W.

