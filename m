From: Jason Keltz <jas@cs.yorku.ca>
Subject: reiserfs3 bug?
Date: Wed, 05 Apr 2006 10:39:23 -0400
Message-ID: <4433D69B.6010406@cs.yorku.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28446-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Our Linux 2.4.32 NFS fileserver exports 4 reiserfs 3.6 filesystems to a 
whole bunch of hosts.  Somewhere between every 6-30 days, NFS suddenly 
seems to "hang" (ie. all the hosts gets the "nfs server not responding" 
message).  The server is still up (we can ssh to it/etc).  Up to this 
point, we've thought it was a bug in nfs.  We recently installed SGI kdb 
  (kernel debugger) to help with debugging the problem, and we're 
wondering now whether it is actually reiserfs related.  We need to get 
the output from several crashes in order to do more debugging, although 
we believe the problem is probably the same each time.

In a normal state, the WCHAN column on "ps" output lists the nfsd and 
[kreiserfsd] processes as "end".  When the system gets into this state, 
both the nfsd and [kreiserfsd] processes report "down" for WCHAN.
(I can imagine that if kreiserfsd and nfs are both hanging on the same 
lock, bad things could happen..)

The backtrace when the problem occurs for kreiserfsd yields:

Mar 28 13:04:24 0xf635a000      247        1  0    1   D  0xf635a370 
kreiserfsd
Mar 28 13:04:24 ESP        EIP        Function (args)
Mar 28 13:04:24 0xf635bef8 0xc011b144 schedule+0x2b4 (0xc0452e40, 0x0, 
0xf635a000, 0xd4a10970, 0xd4a10970)
Mar 28 13:04:24                                kernel .text 0xc0100000 
0xc011ae90 0xc011b3d0
Mar 28 13:04:24 0xf635bf40 0xc014680e __wait_on_buffer+0x6e (0xd4a10920, 
0x9e0, 0xf635bf90, 0xc2937000, 0xf8ac6000)
Mar 28 13:04:24                                kernel .text 0xc0100000 
0xc01467a0 0xc0146840
Mar 28 13:04:24 0xf635bf68 0xf8943e79 [reiserfs]flush_commit_list+0x3e9
Mar 28 13:04:24                                reiserfs .text 0xf8921060 
0xf8943a90 0xf8943f60
Mar 28 13:04:24 0xf635bfa8 0xf894801d [reiserfs]flush_async_commits+0x3d 
(0xf7576800, 0xdd667cc0, 0xf635bfd8, 0xf635bfdc, 0x20)
Mar 28 13:04:24                                reiserfs .text 0xf8921060 
0xf8947fe0 0xf8948020
Mar 28 13:04:25 0xf635bfb8 0xf894652b 
[reiserfs]reiserfs_journal_commit_thread+0x1db
Mar 28 13:04:25                                reiserfs .text 0xf8921060 
0xf8946350 0xf89465f0
Mar 28 13:04:25 0xf635bff4 0xc010741e arch_kernel_thread+0x2e
Mar 28 13:04:25                                kernel .text 0xc0100000 
0xc01073f0 0xc0107430

single stepping on the processor after the problem reveals that the 
system is "idle"/not doing anything else with this.

I won't bother including the output of the backtrace of the 256 nfs 
processes on our fileserver here, but they probably give a lot more of 
the story.   If you are interested, please see this link for the full 
details:

http://www.cs.yorku.ca/~jas/fileserver

If anyone has any ideas, or anywhere we could insert debugging code iin 
order to help solve this problem, we would *really* appreciate your help!

We recently upgraded from 2.4.26 to 2.4.32 in the hopes that the bug 
would have been fixed, but it didn't make any difference.

ps: A few times, when we issue the "reboot" command, the systems get 
"unstuck" (systems get "nfs ok") just before the system reboots... 
whatever is stuck seems to get unstuck for a moment before the system is 
rebooted.

Thanks..

Jason Keltz
jas@cs.yorku.ca

