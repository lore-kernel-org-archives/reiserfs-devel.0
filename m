From: =?iso-8859-1?Q?Oscar_Garc=EDa?= <ogarcia@atlasit.com>
Subject: Problem with ReiserFS + NFS + Convolo
Date: Sat, 14 Jun 2003 14:29:21 +0200
Message-ID: <003001c33270$967bd650$1501a8c0@int.atlassolutions.net>
Reply-To: =?iso-8859-1?Q?Oscar_Garc=EDa?= <ogarcia@atlasit.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002D_01C33281.58D17D80"
Return-path: <reiserfs-list-return-14539-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: eramos@atlasit.com

------=_NextPart_000_002D_01C33281.58D17D80
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm running  a linux cluster with convolo and two nodes. One of the =
services I offer from this cluster is nfs to a bunch of solaris =
machines. Now every so often I get an error like this:


Machine 1

Jun 13 13:29:44 cluster1 kernel: 0: reiserfs_unlink
Jun 13 13:29:44 cluster1 kernel: reiserfs[3736]: assertion !( !truncate =
&& ( inode -> u.reiserfs_i.i_flags & i_link_saved_un
link_mask ) ) failed at super.c:238:add_save_link: saved link already =
exists for unlinked inode c16f7
Jun 13 13:29:44 cluster1 kernel: invalid operand: 0000
Jun 13 13:29:44 cluster1 kernel: CPU:    0
Jun 13 13:29:44 cluster1 kernel: EIP:    0010:[reiserfs_panic+41/96]    =
Not tainted
Jun 13 13:29:44 cluster1 kernel: EIP:    0010:[<c01bb459>]    Not =
tainted
Jun 13 13:29:44 cluster1 kernel: EFLAGS: 00010296
Jun 13 13:29:44 cluster1 kernel: eax: 000000c4   ebx: c02b4000   ecx: =
f73ae000   edx: 00000001
Jun 13 13:29:44 cluster1 kernel: esi: 00000000   edi: da597dfc   ebp: =
00000000   esp: da597d48
Jun 13 13:29:44 cluster1 kernel: ds: 0018   es: 0018   ss: 0018
Jun 13 13:29:44 cluster1 kernel: Process nfsd (pid: 3736, =
stackpage=3Dda597000)
Jun 13 13:29:44 cluster1 kernel: Stack: c029bad0 c03783a0 c02b4000 =
da597d6c cbbb8420 c02f5354 c01b9139 00000000
Jun 13 13:29:44 cluster1 kernel:        c02b4000 00000e98 000000ee =
000c16f7 0008a2eb 000bfc24 00000000 00000000
Jun 13 13:29:44 cluster1 kernel:        002cffff 000107e0 002cffff =
00010fd4 00000001 00000000 00000000 00000000
Jun 13 13:29:44 cluster1 kernel: Call Trace: [add_save_link+185/592] =
[reiserfs_unlink+384/528] [reiserfs_fh_to_dentry+384/41
6] [in_group_p+30/48] [vfs_permission+121/288]
Jun 13 13:29:44 cluster1 kernel: Call Trace: [<c01b9139>] [<c01aea50>] =
[<c01b1cd0>] [<c0124dfe>] [<c0143719>]
Jun 13 13:29:44 cluster1 kernel:    [vfs_unlink+287/384] =
[nfsd_unlink+386/464] [nfsd3_proc_remove+187/208] [nfsd_dispatch+19
3/429] [svc_process+1063/1599] [nfsd+522/832]
Jun 13 13:29:44 cluster1 kernel:    [<c01457bf>] [<c018d622>] =
[<c0191d5b>] [<c01883d1>] [<c0288947>] [<c01881da>]
Jun 13 13:29:44 cluster1 kernel:    [kernel_thread+38/48] [nfsd+0/832]
Jun 13 13:29:44 cluster1 kernel:    [<c0105836>] [<c0187fd0>]
Jun 13 13:29:44 cluster1 kernel:
Jun 13 13:29:44 cluster1 kernel: Code: 0f 0b 68 a0 83 37 c0 85 f6 74 12 =
66 8b 46 08 25 ff ff 00 00
Jun 13 13:29:55 cluster1 kernel:  <5>nfs: server lhnfs not responding, =
still trying
Jun 13 13:29:56 cluster1 kernel: nfs: server lhnfs not responding, still =
trying

Machine 2

Jun 13 14:23:08 cluster2 kernel: 0: reiserfs_unlink
Jun 13 14:23:08 cluster2 kernel: reiserfs[4039]: assertion !( !truncate =
&& ( inode -> u.reiserfs_i.i_f
lags & i_link_saved_unlink_mask ) ) failed at super.c:238:add_save_link: =
saved link already exists for
 unlinked inode c1751
Jun 13 14:23:08 cluster2 kernel: invalid operand: 0000
Jun 13 14:23:08 cluster2 kernel: CPU:    1
Jun 13 14:23:08 cluster2 kernel: EIP:    0010:[reiserfs_panic+41/96]    =
Not tainted
Jun 13 14:23:08 cluster2 kernel: EIP:    0010:[<c01bb459>]    Not =
tainted
Jun 13 14:23:08 cluster2 kernel: EFLAGS: 00010296
Jun 13 14:23:08 cluster2 kernel: eax: 000000c4   ebx: c02b4000   ecx: =
f7390000   edx: 00000001
Jun 13 14:23:08 cluster2 kernel: esi: 00000000   edi: f5bb5dfc   ebp: =
00000000   esp: f5bb5d48
Jun 13 14:23:08 cluster2 kernel: ds: 0018   es: 0018   ss: 0018
Jun 13 14:23:08 cluster2 kernel: Process nfsd (pid: 4039, =
stackpage=3Df5bb5000)
Jun 13 14:23:08 cluster2 kernel: Stack: c029bad0 c03783a0 c02b4000 =
f5bb5d6c d80235e0 c02f5354 c01b9139
 00000000
Jun 13 14:23:08 cluster2 kernel:        c02b4000 00000fc7 000000ee =
000c1751 0008a2eb 000bfc24 00000000
 00000000
Jun 13 14:23:08 cluster2 kernel:        002cffff 000107e0 002cffff =
00010f14 00000001 00000000 00000000
 00000000
Jun 13 14:23:08 cluster2 kernel: Call Trace: [add_save_link+185/592] =
[reiserfs_unlink+384/528] [reiser
fs_fh_to_dentry+384/416] [in_group_p+30/48] [vfs_permission+121/288]
Jun 13 14:23:08 cluster2 kernel: Call Trace: [<c01b9139>] [<c01aea50>] =
[<c01b1cd0>] [<c0124dfe>] [<c01
43719>]
Jun 13 14:23:08 cluster2 kernel:    [vfs_unlink+287/384] =
[nfsd_unlink+386/464] [nfsd3_proc_remove+187/
208] [nfsd_dispatch+193/429] [svc_process+1063/1599] [nfsd+522/832]
Jun 13 14:23:08 cluster2 kernel:    [<c01457bf>] [<c018d622>] =
[<c0191d5b>] [<c01883d1>] [<c0288947>] [
<c01881da>]
Jun 13 14:23:08 cluster2 kernel:    [kernel_thread+38/48] [nfsd+0/832]
Jun 13 14:23:08 cluster2 kernel:    [<c0105836>] [<c0187fd0>]
Jun 13 14:23:08 cluster2 kernel:
Jun 13 14:23:08 cluster2 kernel: Code: 0f 0b 68 a0 83 37 c0 85 f6 74 12 =
66 8b 46 08 25 ff ff 00 00

And the uptime of the machine begins to go up, and up, and up... As soon =
as this happens processes begin to get blocked in the wait queue of the =
kernel, and the machine is still up but gives no service.

There's something more that maybe it's linked to this. These machines =
restart on their own every so often. I think its a hardware thing, but =
I'm not sure. I'm handling this with compaq. The problem here is that =
this hard reboots mayde degrade the filesystem.=20

This error happened 10h after a reiserfsck --fix-fixable that fixed 2 =
minor things.

My setup uis the following:

2x Compaq DL360G2, 2xPIII 14.Ghz, 2Gb RAM, 2x18Gb HDD, 1 QL2000 FC =
Adapter
1x External Storage of 1.4 Tb
Running RedHat 7.2, kernel 2.4.18 #12 SMP with patches for Convolo 2.0 =
(www.missioncrtiticallinux.com)

CCRTVi-cluster2:/var/log:#gcc -v
Reading specs from /usr/lib/gcc-lib/i386-redhat-linux/2.96/specs
gcc version 2.96 20000731 (Red Hat Linux 7.1 2.96-98)

Any help would be very appreciated!
------=_NextPart_000_002D_01C33281.58D17D80--

