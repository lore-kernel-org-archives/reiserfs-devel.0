From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Patches for what version?
Date: Thu, 2 Oct 2003 19:25:50 +0400
Message-ID: <16252.17278.53969.949604@laputa.namesys.com>
References: <1065107815.3f7c416775650@home.students.uni-marburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15771-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1065107815.3f7c416775650@home.students.uni-marburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zapf@students.uni-marburg.de
Cc: reiserfs-list@namesys.com

Zapf@students.uni-marburg.de writes:
 > 
 > Hi guys,
 > 
 > I've been trying to patch sources with a reiser4 patch, but without usable 
 > results. The snapshots/LATEST demand files in a linux-2.5/ subdirectory, which 
 > doesnt accord with the announcment that they would be for linux-2.6-test4.

If you are talking about file names in the diff headers, like the
following:

diff -rupN -X /home/green/dontdiff -x all-reiser4.c -x regression.sh -x ulevel -x '*.bak' -x Makefile.user-level linux-2.5/arch/i386/kernel/entry.S reiser4-linux-2.5-snapshot/arch/i386/kernel/entry.S
--- linux-2.5/arch/i386/kernel/entry.S	2003-09-12 16:35:59.000000000 +0400
+++ reiser4-linux-2.5-snapshot/arch/i386/kernel/entry.S	2003-09-12 15:54:53.000000000 +0400
@@ -879,5 +879,10 @@ ENTRY(sys_call_table)

then don't worry: they are completely arbitrary.

 > 
 > Even if I force 'patch' to work (-p1), the results are not appealing (compile 
 > errors).

What errors?

 > 
 > I don't care all that much which kernel version I use, I just want to play 
 > around a little with Reiser4, betatest it, and try some stuff with it that 
 > seems promising to me, so I just need two bits of information:
 > 
 > - For which Kernel version (please name it exactly) do you have patches ready 
 > for download, and what's their exact url?

LATEST snapshot is against linux-2.6.0-test5 (as mentioned in its
READ.ME file). You can get this kernel from kernel.org.

 > 
 > - What is the second patch in the dir's (...-kernelonly.diff) good for?

This is part of reiser4.diff only modifying files outside of fs/reiser4
sub-directory. Useful when one gets content of fs/reiser4 by other means
(like importing our BK repository).

 > 
 > I'd appreciate any answers to this.
 > 

Feel free to ask more.

 > Thanks in Advance,
 > 
 >          B. Zapf

Nikita.
