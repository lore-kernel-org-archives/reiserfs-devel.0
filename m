From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: Tue, 12 Nov 2002 18:29:49 +0100
Message-ID: <20021112182949.45436c95.philippe.gramoulle@mmania.com>
References: <20021031210828.45F4A216991@server5.fastmail.fm>
	<1036099804.14984.165.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11976-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1036099804.14984.165.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com, jh_lists@fastmail.fm, green@namesys.com


Hi Chris,

On 31 Oct 2002 16:30:04 -0500
Chris Mason <mason@suse.com> wrote:

  |  On Thu, 2002-10-31 at 16:08, JP Howard wrote:
  |  > On 31 Oct 2002 15:38:19 -0500, "Chris Mason" <mason@suse.com> said:
  |  > <...>
  |  > > The idea is that during boundless operations (creating a hole, and
  |  > > truncates), the journal code wasn't properly reserving log blocks. 
  |  > <...>
  |  > 
  |  > Chris, what can trigger this situation? We're currently running
  |  > data=journal on 2.4.20pre in production--are we at risk?
  |  > 
  |  
  |  This bug is pretty hard to hit.  It has been in every single version of
  |  journaling reiserfs, including 2.2.x.  So far, we've gotten two reports
  |  of it in about 3 years (oddly, both were this month).

We hit it almost everyday last week.

Here is another one , from few minutes ago :-(

ksymoops 2.4.5 on i686 2.4.19-pre6.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.19-pre6/ (default)
     -m /boot/System.map-2.4.19-pre6 (specified)

kernel BUG at prints.c:334!
invalid operand: 0000
CPU:    0
EIP:    0010:[reiserfs_panic+41/96]    Not tainted
EFLAGS: 00010286
eax: 0000003d   ebx: c0268640   ecx: 00000002   edx: 02000000
esi: f7e4d800   edi: 00000019   ebp: 00000000   esp: f43f1af4
ds: 0018   es: 0018   ss: 0018
Process nfsd (pid: 230, stackpage=f43f1000)
Stack: c02650da c031f5e0 c0268640 f43f1b18 f43f1ec8 f538eae0 c01a1bcc f7e4d800 
       c0268640 00000400 f7e4d800 000004cb f43f1ec8 0265bb4f ffffffff 00000000 
       c0184144 f43f1ec8 f7e4d800 f538eae0 f43f1ec8 0265bb4f 00000001 cb6dd4a0 
Call Trace: [journal_mark_dirty+352/800] [_reiserfs_free_block+180/460] [reiserfs_free_block+39/48] [prepare_for_delete_or_cut+1635/1804] [reiserfs_cut_from_item+151/1312] [reiserfs_do_truncate+765/1068] [reiserfs_delete_object+35/80] [reiserfs_delete_inode+202/316] [reiserfs_delete_inode+0/316] [iput+355/616] [d_delete+98/160] [vfs_unlink+489/544] [nfsd_unlink+403/480] [nfsd3_proc_remove+198/212] [nfsd_dispatch+211/410] [svc_process+653/1236] [nfsd+503/808] [kernel_thread+40/56] 
Code: 0f 0b 4e 01 e0 50 26 c0 68 e0 f5 31 c0 85 f6 74 16 0f b7 46
Using defaults from ksymoops -t elf32-i386 -a i386


>>ebx; c0268640 <MAX_KEY+2220/4aa8>
>>edx; 02000000 Before first symbol
>>esi; f7e4d800 <_end+37b06024/385e7824>
>>esp; f43f1af4 <_end+340aa318/385e7824>

Code;  00000000 Before first symbol
00000000 <_EIP>:
Code;  00000000 Before first symbol
   0:   0f 0b                     ud2a   
Code;  00000002 Before first symbol
   2:   4e                        dec    %esi
Code;  00000003 Before first symbol
   3:   01 e0                     add    %esp,%eax
Code;  00000005 Before first symbol
   5:   50                        push   %eax
Code;  00000006 Before first symbol
   6:   26 c0 68 e0 f5            shrb   $0xf5,%es:0xffffffe0(%eax)
Code;  0000000b Before first symbol
   b:   31 c0                     xor    %eax,%eax
Code;  0000000d Before first symbol
   d:   85 f6                     test   %esi,%esi
Code;  0000000f Before first symbol
   f:   74 16                     je     27 <_EIP+0x27> 00000027 Before first symbol
Code;  00000011 Before first symbol
  11:   0f b7 46 00               movzwl 0x0(%esi),%eax


  |  
  |  What can trigger it?  I honestly haven't been able to force the problem
  |  to happen, it should require a very high load of processes doing
  |  deletions (or hole creations), along with a very high system load in
  |  general.

Hmm, this is what we currently have :-( right now 128 NFSD thread. 2.4.19-pre6 has
a hardcoded limit and i'd like to raise it to 256 NFSd threads or so , so it would be even more likely to
hit the bug.

  |  
  |  The logging code padds all the reservations for space in the log, making
  |  it very hard to hit the hard limit of 1024 blocks per transactions.
  |  
  |  Both sites that have hit the bug have a very large number of files
  |  (millions), meaning that metadata operations will tend to log more
  |  blocks, making the bug more likely.
  |  
  |  If you have less than a million files, you'll probably never be able to
  |  hit it.  I'm still going to try and get the fix into 2.4.20 though.

Do you have a fix that could be used in 2.4.20-(pre|rc) right now ? ( we need quota as well)

This is becoming really critical and even a not 110% tested patch would be welcome.

Thanks,

Philippe.

  |  
  |  -chris
  |  
  |  
  |  
