From: =?ISO-8859-1?Q?Jussi_Vainionp=E4=E4?= <jjvainio@cc.hut.fi>
Subject: Journal-601 error on Redhat 7.3 / reiserfs / ext3 / raid 5
Date: Tue, 01 Jul 2003 00:52:25 +0300
Message-ID: <3F00B119.7080701@cc.hut.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14791-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Any ideas what might be causing this:

I created a 1.5 GB Reiserfs filesystem on a loopback device on an ext3 
filesystem on software raid 5 with 4 ide disks.

The system ran fine first but then I attempted to convert a bunch of 
huge mailboxes to maildirs creating tens of thousands of small files. At 
some point in middle of the conversion the process froze and I got the 
included error into my kernel log.

I don't think my disks are faulty, because the raid 5 / ext3 combination 
has ran without trouble for a year (and is still running after a few 
months). There were no disk-related log messages anywhere near the panic.

The machine is running Redhat 7.3 with 2.4.18-5 kernel.


The log message (and some context):

Apr 27 14:17:32 un kernel: reiserfs: checking transaction log (device 
07:00) ...
Apr 27 14:17:34 un kernel: Using r5 hash to sort names
Apr 27 14:17:34 un kernel: ReiserFS version 3.6.25
Apr 27 15:01:01 un su(pam_unix)[7730]: session opened for user bin by
Apr 27 15:01:03 un su(pam_unix)[7730]: session closed for user bin
Apr 27 15:51:06 un sshd(pam_unix)[6720]: session closed for user root
Apr 27 16:01:00 un su(pam_unix)[8594]: session opened for user bin by
Apr 27 16:01:02 un su(pam_unix)[8594]: session closed for user bin
Apr 27 17:01:01 un su(pam_unix)[8835]: session opened for user bin by
Apr 27 17:01:02 un su(pam_unix)[8835]: session closed for user bin
Apr 27 18:01:00 un su(pam_unix)[8982]: session opened for user bin by
Apr 27 18:01:01 un su(pam_unix)[8982]: session closed for user bin
Apr 27 18:08:58 un sshd(pam_unix)[9020]: session opened for user root by
Apr 27 18:09:33 un kernel: eth0: Too much work at interrupt, 
IntrStatus=0x0001.
Apr 27 18:12:55 un kernel: eth0: Too much work at interrupt, 
IntrStatus=0x0001.
Apr 27 18:29:32 un kernel: eth0: Too much work at interrupt, 
IntrStatus=0x0001.
Apr 27 18:42:36 un sshd(pam_unix)[9020]: session closed for user root
Apr 27 18:43:37 un sshd(pam_unix)[9131]: session opened for user root by
Apr 27 19:17:54 un sshd(pam_unix)[9297]: session opened for user xxxx
Apr 27 19:21:16 un sshd(pam_unix)[9297]: session closed for user xxxx
Apr 27 19:27:05 un kernel: eth0: Too much work at interrupt, 
IntrStatus=0x0001.
Apr 27 19:29:29 un sshd(pam_unix)[9356]: session opened for user xxxx by
Apr 27 19:33:00 un sshd(pam_unix)[9356]: session closed for user xxxx
Apr 27 20:01:01 un su(pam_unix)[9501]: session opened for user bin by
Apr 27 20:01:03 un su(pam_unix)[9501]: session closed for user bin
Apr 27 20:08:03 un kernel: eth0: Too much work at interrupt, 
IntrStatus=0x0001.
Apr 27 20:18:06 un kernel: journal-601, buffer write failed
Apr 27 20:18:06 un kernel: ------------[ cut here ]------------
Apr 27 20:18:06 un kernel: kernel BUG at prints.c:334!
Apr 27 20:18:06 un kernel: invalid operand: 0000
Apr 27 20:18:06 un kernel: reiserfs vfat fat loop 8021q autofs 8139too 
mii ipt_REJECT iptable_nat ip_conn
Apr 27 20:18:06 un kernel: CPU:    0
Apr 27 20:18:06 un kernel: EIP:    0010:[<c59e3f1b>]    Not tainted
Apr 27 20:18:06 un kernel: EFLAGS: 00010282
Apr 27 20:18:06 un kernel:
Apr 27 20:18:06 un kernel: EIP is at reiserfs_panic [reiserfs] 0x3b 
(2.4.18-5)
Apr 27 20:18:06 un kernel: eax: 0000001c   ebx: c59f8b00   ecx: 00000001 
   edx: 0000451e
Apr 27 20:18:06 un kernel: esi: c2519c00   edi: 00001758   ebp: c2519c00 
   esp: c11e9eb0
Apr 27 20:18:06 un kernel: ds: 0018   es: 0018   ss: 0018
Apr 27 20:18:06 un kernel: Process kupdated (pid: 7, stackpage=c11e9000)
Apr 27 20:18:07 un kernel: Stack: c59fb70a 0000014e c5a04464 0000021d 
c59ee637 c2519c00 c59f8b00 00000312
Apr 27 20:18:07 un kernel:        00000000 0000003d c0f30ae0 c5a30184 
c013a428 00000700 00001a7a c5a03000
Apr 27 20:18:07 un kernel:        0000003c 00000010 00000000 c59f2122 
c2519c00 c5a04464 00000001 00003a68
Apr 27 20:18:07 un kernel: Call Trace: [<c59fb70a>] .rodata.str1.1 
[reiserfs] 0x44a
Apr 27 20:18:07 un kernel: [<c59ee637>] flush_commit_list [reiserfs] 0x2a7
Apr 27 20:18:07 un kernel: [<c59f8b00>] .rodata.str1.32 [reiserfs] 0x40e0
Apr 27 20:18:07 un kernel: [<c013a428>] getblk [kernel] 0x18
Apr 27 20:18:07 un kernel: [<c59f2122>] do_journal_end [reiserfs] 0x7e2
Apr 27 20:18:07 un kernel: [<c59f1312>] flush_old_commits [reiserfs] 0x142
Apr 27 20:18:07 un kernel: [<c59f1320>] flush_old_commits [reiserfs] 0x150
Apr 27 20:18:07 un kernel: [<c59fba6d>] .LC35 [reiserfs] 0x22
Apr 27 20:18:07 un kernel: [<c59e1725>] reiserfs_write_super [reiserfs] 0x15
Apr 27 20:18:07 un kernel: [<c013d40e>] sync_supers [kernel] 0xbe
Apr 27 20:18:07 un kernel: [<c013c8fc>] sync_old_buffers [kernel] 0xc
Apr 27 20:18:07 un kernel: [<c013cbc0>] kupdate [kernel] 0xe0
Apr 27 20:18:07 un kernel: [<c0105000>] stext [kernel] 0x0
Apr 27 20:18:07 un kernel: [<c0105000>] stext [kernel] 0x0
Apr 27 20:18:08 un kernel: [<c0107136>] kernel_thread [kernel] 0x26
Apr 27 20:18:08 un kernel: [<c013cae0>] kupdate [kernel] 0x0
Apr 27 20:18:08 un kernel:
Apr 27 20:18:08 un kernel:
Apr 27 20:18:08 un kernel: Code: 0f 0b 5b 58 68 c0 fe 9f c5 85 f6 74 0d 
0f b7 46 08 50 e8 4e



ksymoops output (doesn't make sense to me):



ksymoops 2.4.4 on i686 2.4.18-5.  Options used
      -V (default)
      -k /proc/ksyms (default)
      -l /proc/modules (default)
      -o /lib/modules/2.4.18-5/ (default)
      -m /boot/System.map-2.4.18-5 (default)

Warning: You did not tell me where to find symbol information.  I will

....


 >>EIP; c59e3f1b <[smbfs].data.end+2249c/56581>   <=====
Trace; c59fb70a <[smbfs].data.end+39c8b/56581>
Trace; c59ee637 <[smbfs].data.end+2cbb8/56581>
Trace; c59f8b00 <[smbfs].data.end+37081/56581>
Trace; c013a428 <getblk+18/40>
Trace; c59f2122 <[smbfs].data.end+306a3/56581>
Trace; c59f1312 <[smbfs].data.end+2f893/56581>
Trace; c59f1320 <[smbfs].data.end+2f8a1/56581>
Trace; c59fba6d <[smbfs].data.end+39fee/56581>
Trace; c59e1725 <[smbfs].data.end+1fca6/56581>
Trace; c013d40e <sync_supers+be/e0>
Trace; c013c8fc <sync_old_buffers+c/40>
Trace; c013cbc0 <kupdate+e0/100>
Trace; c0105000 <_stext+0/0>
Trace; c0105000 <_stext+0/0>
Trace; c0107136 <kernel_thread+26/30>
Trace; c013cae0 <kupdate+0/100>
Code;  c59e3f1b <[smbfs].data.end+2249c/56581>
00000000 <_EIP>:
Code;  c59e3f1b <[smbfs].data.end+2249c/56581>   <=====
    0:   0f 0b                     ud2a      <=====
Code;  c59e3f1d <[smbfs].data.end+2249e/56581>
    2:   5b                        pop    %ebx
Code;  c59e3f1e <[smbfs].data.end+2249f/56581>
    3:   58                        pop    %eax
Code;  c59e3f1f <[smbfs].data.end+224a0/56581>
    4:   68 c0 fe 9f c5            push   $0xc59ffec0
Code;  c59e3f24 <[smbfs].data.end+224a5/56581>
    9:   85 f6                     test   %esi,%esi
Code;  c59e3f26 <[smbfs].data.end+224a7/56581>
    b:   74 0d                     je     1a <_EIP+0x1a> c59e3f35 
<[smbfs].data.end+224b6/56581>
Code;  c59e3f28 <[smbfs].data.end+224a9/56581>
    d:   0f b7 46 08               movzwl 0x8(%esi),%eax
Code;  c59e3f2c <[smbfs].data.end+224ad/56581>
   11:   50                        push   %eax
Code;  c59e3f2d <[smbfs].data.end+224ae/56581>
   12:   e8 4e 00 00 00            call   65 <_EIP+0x65> c59e3f80 
<[smbfs].data.end+22501/56581>


1 warning issued.  Results may not be reliable.



