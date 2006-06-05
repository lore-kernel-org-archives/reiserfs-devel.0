From: "Gad Kadosh" <gad.kadosh@gmail.com>
Subject: Kernel oops in reiserfs xattr
Date: Tue, 6 Jun 2006 00:13:30 +0300
Message-ID: <ba8ab8b0606051413x29b15e9akc7ded53948333aec@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28737-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I've been using xattr with beagle for a long time, and recently I get
all the time kernel oops. attached is the log, can someone help me
solve the problem ?
By the way this is with kernel 2.6.17-rc5, tried with other 2.6.17-rcX
and also 2.6.16.

Thanks

Gad





May 28 10:26:51 ibook Unable to handle kernel paging request for data
at address 0x6372525a
May 28 10:26:51 ibook Faulting instruction address: 0xc00c35d4
May 28 10:26:51 ibook Oops: Kernel access of bad area, sig: 11 [#1]
May 28 10:26:51 ibook
May 28 10:26:51 ibook Modules linked in: radeon drm rfcomm l2cap
hci_usb snd_seq snd_seq_device snd_powermac snd_pcm snd_timer snd
soundcore snd_page_alloc bluetooth cpufreq_userspace therm_adt746x
i2c_powermac evdev eth1394 appletouch usbhid bcm43xx firmware_class
ieee80211softmac ieee80211 ieee80211_crypt ide_cd ehci_hcd ohci_hcd
usbcore cdrom uninorth_agp agpgart ohci1394 sungem ieee1394 sungem_phy
unix
May 28 10:26:51 ibook NIP: C00C35D4 LR: C00C3EB8 CTR: C00C3E7C
May 28 10:26:51 ibook REGS: d2a51b90 TRAP: 0300   Not tainted  (2.6.17-rc4)
May 28 10:26:51 ibook MSR: 00009032 <EE,ME,IR,DR>  CR: 44042448  XER: 00000000
May 28 10:26:51 ibook DAR: 6372525A, DSISR: 40000000
May 28 10:26:51 ibook TASK = d3f7d330[8065] 'beagled' THREAD: d2a50000
May 28 10:26:51 ibook GPR00: C00C3EB8 D2A51C40 D3F7D330 C028A529
6372525A C028A8E8 D2A51CB8 6372525A
May 28 10:26:51 ibook GPR08: 00000017 D2A51CC0 C028A914 00000004
24042444 1019C188 00000001 00000000
May 28 10:26:51 ibook GPR16: 00000001 C9BCDDA0 00000011 15212B37
41584652 C165EE5C C1656354 D2A51DA8
May 28 10:26:51 ibook GPR24: 00000000 C16563A4 C028A4E8 C028A529
D2A51CB8 C028A529 00000001 6372525A
May 28 10:26:51 ibook NIP [C00C35D4] sprintf_le_key+0x1c/0x834
May 28 10:26:51 ibook LR [C00C3EB8] prepare_error_buf+0xcc/0x6f4
May 28 10:26:51 ibook Call Trace:
May 28 10:26:51 ibook [D2A51C40] [C16563A4] 0xc16563a4 (unreliable)
May 28 10:26:51 ibook [D2A51C60] [C00C3EB8] prepare_error_buf+0xcc/0x6f4
May 28 10:26:51 ibook [D2A51CB0] [C00C356C] reiserfs_warning+0x58/0xa4
May 28 10:26:51 ibook [D2A51CF0] [C00DD2B0] reiserfs_xattr_get+0x1f4/0x218
May 28 10:26:51 ibook [D2A51D40] [C00DD694] user_get+0x60/0x7c
May 28 10:26:51 ibook [D2A51D60] [C00DC848] reiserfs_getxattr+0xc0/0x160
May 28 10:26:51 ibook [D2A51D80] [C008E95C] vfs_getxattr+0x7c/0x84
May 28 10:26:51 ibook [D2A51DA0] [C008E9E0] getxattr+0x7c/0x178
May 28 10:26:51 ibook [D2A51ED0] [C008EB90] sys_lgetxattr+0x50/0x74
May 28 10:26:51 ibook [D2A51F40] [C000F524] ret_from_syscall+0x0/0x38
May 28 10:26:51 ibook --- Exception: c01 at 0xfd6fa54
May 28 10:26:51 ibook LR = 0xfa2ce90
May 28 10:26:51 ibook Instruction dump:
May 28 10:26:51 ibook 80010044 7c0803a6 83e1003c 38210040 4e800020
9421ffe0 7c0802a6 bf61000c
May 28 10:26:51 ibook 90010024 7c7d1b78 7c9f2379 41820744 <801f0000>
5409463e 7d3b4b78 501bc42e
