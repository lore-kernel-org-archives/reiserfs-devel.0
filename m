From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Quota patches and  kinoded versions
Date: Wed, 30 Oct 2002 16:13:33 +0100
Message-ID: <20021030161333.77b577f2.philippe.gramoulle@mmania.com>
References: <20021029201853.73380d45.philippe.gramoulle@mmania.com>
	<1035981874.8455.9.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11839-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1035981874.8455.9.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 30 Oct 2002 07:44:33 -0500
Chris Mason <mason@suse.com> wrote:

  |  The kinoded-8 patch was updated to 2.4.19-pre7, but not changes were
  |   made other than a simple merge.

Ok.

  |  
  |   > 
  |   > Also, do you plan to sync quota patches with 2.4.20pre or with 2.4.20 final once its out ?
  |  
  |   These won't fix the oops you posted yesterday.  I've got a patch in
  |   testing here, I was hoping to reproduce the bug before sending it out
  |   (instead of just guessing ;-)  I'll cleanup the debugging statements and
  |   get you something worth using.

Unfortunately, we got another oops on another filer yesterday which seems to be because of the same
bug ( ksymoops at the end)

The above statement leads me to think that this bug could still be hit even if i
had 2.4.20-rc1 , right ?

On the same filer, i also found this in the logs: 

VFS: find_free_dqentry(): Data block full but it shouldn't.
VFS: Error -5 occured while creating quota.
VFS: find_free_dqentry(): Data block full but it shouldn't.
VFS: Error -5 occured while creating quota.
etc..

FS id 70% full
/dev/sdc1            572418604 396500272 175918332  70% /storage


I know you are busy and the different timelines don't help much :-(

Quotas are vital to us so we can track abusers and prevent the fs to fill up to 100%
(it is what already happened on one filer here)

I can help you test whatever patch/fix you will provide even if you just *guessed* ;o)
whatever the bug(s) can be.

Thanks much.

Philippe

journal-1413: journal_mark_dirty: j_len (1024) is too big
kernel BUG at prints.c:334!
invalid operand: 0000
CPU:    1
EIP:    0010:[reiserfs_panic+41/96]    Not tainted
EFLAGS: 00010286
eax: 0000003d   ebx: c0268640   ecx: ffffffff   edx: 00000002Oct 29 22:27:47 smembf17 kernel: kernel BUG at prints.c:334!
invalid operand: 0000

esi: f56d0c00   edi: 00000019   ebp: 00000000   esp: f427baf4
ds: 0018   es: 0018   ss: 0018
Process nfsd (pid: 215, stackpage=f427b000)
Stack: c02650da c031f5e0 c0268640 f427bb18 f427bec8 f5273a20 c01a1bcc f56d0c00 
       c0268640 00000400 f56d0c00 00000445 f427bec8 0222beb8 ffffffff 00000000 
       c0184144 f427bec8 f56d0c00 f5273a20 f427bec8 0222beb8 00000001 d0c57de0 
Call Trace: [journal_mark_dirty+352/800] [_reiserfs_free_block+180/460] [reiserfs_free_block+39/48] [prepare_for_de
lete_or_cut+1635/1804] [reiserfs_cut_from_item+151/1312] 
   [reiserfs_do_truncate+765/1068] [reiserfs_delete_object+35/80] [reiserfs_delete_inode+202/316] [reiserfs_delete_
inode+0/316] [iput+355/616] [d_delete+98/160] 
   [vfs_unlink+489/544] [nfsd_unlink+403/480] [nfsd3_proc_remove+198/212] [nfsd_dispatch+211/410] [svc_process+653/
1236] [nfsd+503/808] 
   [kernel_thread+40/56] 

Code: 0f 0b 4e 01 e0 50 26 c0 68 e0 f5 31 c0 85 f6 74 16 0f b7 46 

decode doesn't look very reliable to me :-(

# cat oops-reiser2 | ksymoops -m /boot/System.map-2.4.19-pre6 
ksymoops 2.4.6 on i686 2.4.19-pre6.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.19-pre6/ (default)
     -m /boot/System.map-2.4.19-pre6 (specified)

kernel BUG at prints.c:334!
invalid operand: 0000
CPU:    1
EIP:    0010:[reiserfs_panic+41/96]    Not tainted
EFLAGS: 00010286
eax: 0000003d   ebx: c0268640   ecx: ffffffff   edx: 00000002Oct 29 22:27:47 smembf17 kernel: kernel BUG at prints.c:334!
Warning (Oops_set_regs): garbage 'Oct 29 22:27:47 smembf17 kernel: kernel BUG at prints.c:334!' at end of register line ignored
invalid operand: 0000
esi: f56d0c00   edi: 00000019   ebp: 00000000   esp: f427baf4
ds: 0018   es: 0018   ss: 0018
Process nfsd (pid: 215, stackpage=f427b000)
Stack: c02650da c031f5e0 c0268640 f427bb18 f427bec8 f5273a20 c01a1bcc f56d0c00 
       c0268640 00000400 f56d0c00 00000445 f427bec8 0222beb8 ffffffff 00000000 
       c0184144 f427bec8 f56d0c00 f5273a20 f427bec8 0222beb8 00000001 d0c57de0 
Call Trace: [journal_mark_dirty+352/800] [_reiserfs_free_block+180/460] [reiserfs_free_block+39/48] [prepare_for_de
1236] [nfsd+503/808] 
Code: 0f 0b 4e 01 e0 50 26 c0 68 e0 f5 31 c0 85 f6 74 16 0f b7 46 
Using defaults from ksymoops -t elf32-i386 -a i386


>>ebx; c0268640 <MAX_KEY+2220/4aa8>
>>esi; f56d0c00 <_end+35389424/385e7824>
>>esp; f427baf4 <_end+33f34318/385e7824>

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


1 warning issued.  Results may not be reliable.

