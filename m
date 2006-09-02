From: Bernd Schubert <bernd-schubert@gmx.de>
Subject: quota problem with 2.6.15.7
Date: Sat, 2 Sep 2006 15:57:03 +0200
Message-ID: <200609021557.03885.bernd-schubert@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29792-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserfs <reiserfs-list@namesys.com>
Cc: linux-kernel@vger.kernel.org

Hi,

I just wanted to enable quotas on one of our server systems and got an oops.
This is an opteron system with a kernel in 64bit mode.=20
As you can see, the filesystem is reiserfs.

[8278222.836924] Unable to handle kernel paging request at 000000000fd00007=
 RIP:
[8278222.842655] <ffffffff80394699>{__down_read+101}
[8278222.851260] PGD f3509067 PUD adf61067 PMD 0
[8278222.856596] Oops: 0002 [1] SMP
[8278222.860597] CPU 1
[8278222.863231] Modules linked in: ipt_MASQUERADE ipt_state iptable_filter=
 nfsd exportfs iptable_nat ip_nat ip_conntrack ip_tables i2c_
amd8111 pl2303 usbserial ohci_hcd usbcore bluesmoke_k8 bluesmoke_mc w83627h=
f i2c_isa lm85 adm1026 hwmon_vid i2c_amd756 i2c_core bcm5700
[8278222.891808] Pid: 16212, comm: quotaon Not tainted 2.6.15.7 #1
[8278222.898891] RIP: 0010:[<ffffffff80394699>] <ffffffff80394699>{__down_r=
ead+101}
[8278222.907557] RSP: 0018:ffff81003b987b50  EFLAGS: 00010206
[8278222.914370] RAX: ffff8100f81b1408 RBX: ffff810043336180 RCX: ffff8100f=
81b1530
[8278222.923148] RDX: 000000000fd00007 RSI: 0000000000000000 RDI: ffff81003=
b987bc8
[8278222.931931] RBP: ffff8100f81b1400 R08: 0000000000000000 R09: ffff81008=
1ad9440
[8278222.940723] R10: 0000000000001000 R11: ffffffff80394646 R12: 000000000=
0000001
[8278222.949497] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000001
[8278222.958273] FS:  00002aaaaae00090(0000) GS:ffffffff80515880(0000) knlG=
S:00000000558dd2a0
[8278222.968202] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[8278222.975283] CR2: 000000000fd00007 CR3: 00000000dc0aa000 CR4: 000000000=
00006e0
[8278222.984061] Process quotaon (pid: 16212, threadinfo ffff81003b986000, =
task ffff810043336180)
[8278222.994398] Stack: ffff8100f81b1408 0000000000000000 ffff810043336180 =
ffff810000000001
[8278223.004002]        ffff8100f9fb23c0 0000000100000001 ffffffff00000000 =
0000000100000001
[8278223.013841]        ffff810000000000 0000000000000000
[8278223.020126] Call Trace:<ffffffff8017bc08>{link_path_walk+194} <fffffff=
f80394646>{__down_read+18}
[8278223.030894]        <ffffffff80229853>{_atomic_dec_and_lock+43} <ffffff=
ff801bc1f1>{reiserfs_quota_on+191}
[8278223.042504]        <ffffffff8017bc08>{link_path_walk+194} <ffffffff803=
94646>{__down_read+18}
[8278223.052854]        <ffffffff8019f482>{sys_quotactl+960} <ffffffff8014e=
2c5>{find_get_page+31}
[8278223.063186]        <ffffffff8014ed81>{filemap_nopage+364} <ffffffff801=
5ec3e>{__handle_mm_fault+1740}
[8278223.074364]        <ffffffff801766ac>{vfs_getattr_it+72} <ffffffff8017=
6852>{vfs_fstat+108}
[8278223.084496]        <ffffffff80176add>{cp_new_stat+233} <ffffffff802298=
53>{_atomic_dec_and_lock+43}
[8278223.095483]        <ffffffff80183702>{dput+49} <ffffffff80187f9b>{mntp=
ut_no_expire+23}
[8278223.105218]        <ffffffff8016dd9f>{filp_close+89} <ffffffff8010d852=
>{system_call+126}
[8278223.115142]
[8278223.118114]
[8278223.118115] Code: 48 89 22 48 89 54 24 08 c7 45 04 01 00 00 00 fb 48 8=
3 7c 24
[8278223.129157] RIP <ffffffff80394699>{__down_read+101} RSP <ffff81003b987=
b50>
[8278223.137621] CR2: 000000000fd00007


Thanks,
Bernd

=2D-=20
Bernd Schubert
PCI / Theoretische Chemie
Universit=E4t Heidelberg
INF 229
69120 Heidelberg

