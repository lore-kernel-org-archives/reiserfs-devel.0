From: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Subject: Recipe for reiserfs oops on "removable" disks (was: Re: reiserfs on removable media)
Date: Wed, 02 Jul 2003 22:02:58 -0400
Message-ID: <pan.2003.07.02.22.02.56.966628.20132@umail.hungrycats.org>
References: <pan.2003.07.02.14.23.09.812119.20132@umail.hungrycats.org> <pan.2003.07.02.14.23.09.812119.20132@umail.hungrycats.org> <20030702124544.Z7414@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14814-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed, 02 Jul 2003 14:45:44 -0400, Andreas Dilger wrote:
> On Jul 02, 2003  14:23 -0400, Zygo Blaxell wrote:

> This is called ordered data mode, and exists on ext3 and also reiserfs
> with Chris Mason's patches.

Ah, thank you, I had forgotten that the feature had a name, and that ext3
can be configured to have the same behavior.  ;-)

> Well, if something oopses you are pretty much stuck w.r.t. killing the
> process and unmounting the fs.  So fix the oopses and the rest should
> come around as a result.  Of course, the reiserfs folks can do a lot
> more with a specific oops report than just "it immediately oopses".  ;-)

But it _does_ immediately oops.  Actually that's not true, it BUG()s
first.  And depending on the device driver chain it may also oops in
other places.

I guess I forgot that "the oops I've seen about 20 times this morning"
isn't really useful information to other people.  ;-)

You can get a similar oops without any special hardware using the network
block device.  Here's the recipe:

Create a large-file on machine A.  Run 'nbd-server 11111 large-file' on machine
A.  The file has to be big enough that mkreiserfs can create a filesystem
on it.

Run the following on machine B:

	nbd-client A 11111 /dev/nbd/0
	mkreiserfs /dev/nbd/0
	mount /dev/nbd/0 /test
	ls -l / > /test/some-data

Then on machine A:

	killall nbd-server

Then do something on machine B with the /test filesystem, and watch the
fireworks.  It looks something like this:

NBD: receive - sock=-1040559660 at buf=-1047896328, size=16 returned 0
.                                                                               
NBD: Recv control failed.(result 0)                                             
req should never be null                                                        
nbd: shutting down socket                                                       
nbd: queue cleared                                                              
Kernel call returned.Closing: que, sock, done                                   
NBD, minor 0: Request when not-ready.                                           
NBD, minor 0: Request when not-ready.                                           
NBD, minor 0: Request when not-ready.                                           
NBD, minor 0: Request when not-ready.                                           
NBD, minor 0: Request when not-ready.                                           
NBD, minor 0: Request when not-ready.                                           
NBD, minor 0: Request when not-ready.                                           
NBD, minor 0: Request when not-ready.                                           
NBD, minor 0: Request when not-ready.                                           
journal-601, buffer write failed              
[the rest is filtered through ksymoops]
kernel BUG at prints.c:334!                                                     
invalid operand: 0000                                                           
CPU:    0                                                                       
EIP:    0010:[<c01a4fa9>]    Not tainted                                        
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00000282                                                                
eax: 00000024   ebx: c02f2460   ecx: c034cd2c   edx: 00000000                   
esi: c133e000   edi: c133e000   ebp: 00000004   esp: c1fedec8                   
ds: 0018   es: 0018   ss: 0018                                                  
Process kupdated (pid: 6, stackpage=c1fed000)                                   
Stack: c02f035a c0403740 c02f2460 c1fedeec c28540cc 00000000 c01af619 c133e000  
       c02f2460 00000000 00000000 00000010 00000000 c2854100 c28540f4 00000005  
       00000000 c1307814 c01b313e c133e000 c28540cc 00000001 c1fedf80 c133e000  
Call Trace:    [<c01af619>] [<c01b313e>] [<c01b230f>] [<c01a24be>] [<c014b508>] 
  [<c014a267>] [<c014a736>] [<c0107420>]                                        
Code: 0f 0b 4e 01 60 03 2f c0 68 40 37 40 c0 85 f6 74 16 31 c0 66               


>>EIP; c01a4fa9 <reiserfs_panic+29/60>   <=====

>>ebx; c02f2460 <MAX_KEY+1000/4b24>
>>ecx; c034cd2c <log_wait+0/10>
>>esi; c133e000 <_end+ef7548/3047d548>
>>edi; c133e000 <_end+ef7548/3047d548>
>>esp; c1fedec8 <_end+1ba7410/3047d548>

Trace; c01af619 <flush_commit_list+2e5/3e4>
Trace; c01b313e <do_journal_end+7ea/ad0>
Trace; c01b230f <flush_old_commits+137/150>
Trace; c01a24be <reiserfs_write_super+5e/bc>
Trace; c014b508 <sync_supers+14c/1c8>
Trace; c014a267 <sync_old_buffers+5b/140>
Trace; c014a736 <kupdate+1ea/20c>
Trace; c0107420 <arch_kernel_thread+28/38>

Code;  c01a4fa9 <reiserfs_panic+29/60>
00000000 <_EIP>:
Code;  c01a4fa9 <reiserfs_panic+29/60>   <=====
   0:   0f 0b                     ud2a      <=====
Code;  c01a4fab <reiserfs_panic+2b/60>
   2:   4e                        dec    %esi
Code;  c01a4fac <reiserfs_panic+2c/60>
   3:   01 60 03                  add    %esp,0x3(%eax)
Code;  c01a4faf <reiserfs_panic+2f/60>
   6:   2f                        das    
Code;  c01a4fb0 <reiserfs_panic+30/60>
   7:   c0 68 40 37               shrb   $0x37,0x40(%eax)
Code;  c01a4fb4 <reiserfs_panic+34/60>
   b:   40                        inc    %eax
Code;  c01a4fb5 <reiserfs_panic+35/60>
   c:   c0 85 f6 74 16 31 c0      rolb   $0xc0,0x311674f6(%ebp)
Code;  c01a4fbc <reiserfs_panic+3c/60>
  13:   66                        data16


> Not much you can do about the IO errors (i.e. working as designed).
> That's going to happen if you remove your device while writing to it.

I don't mind I/O errors as long as the journalling semantics are preserved
and enough of the kernel is intact to umount and mount again later.
