From: Rob Baxter <burn@bluedevil.ca>
Subject: kernel BUG at fs/reiserfs/journal.c:1313!
Date: Sun, 26 Jun 2005 03:54:15 -0600
Message-ID: <42BE7B47.3070502@bluedevil.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24618-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: reiserfs-list@namesys.com

This is a report of a bug filed with gentoo a few weeks ago.
http://bugs.gentoo.org/show_bug.cgi?id=95043
Below is the contents of this bug. The kernel that was in place is no more, so no further testing 
can be done on this particular machine.

Rob Baxter

Description:  [reply]  	 Opened: 2005-06-04 11:03 PDT

Load shot up on the server, file system was useless (could not read or write to any partition) until 
reboot. I'm upgrading the kernel now to r9, but I thought this may be of use. Let me know if you 
need more info.

------------[ cut here ]------------
kernel BUG at fs/reiserfs/journal.c:1313!
invalid operand: 0000 [#1]
PREEMPT SMP
Modules linked in: iptable_filter
CPU:    0
EIP:    0060:[<c01b7ae0>]    Not tainted VLI
EFLAGS: 00010202   (2.6.11-gentoo-r6)
EIP is at flush_journal_list+0x580/0x640
eax: 00000001   ebx: f8bac1a0   ecx: 00000001   edx: 00000000
esi: ceb851bc   edi: 00000000   ebp: c48be880   esp: d6607db0
ds: 007b   es: 007b   ss: 0068
Process pdflush (pid: 32240, threadinfo=d6606000 task=d846b020)
Stack: f8bac1a0 c48be880 00000001 c27f7ce0 c015c07a d6befefc 00000000 f8816000
        00000000 00000000 0000004c c48be880 000001ec 00000100 e390c080 c01b7f48
        f7ca3000 c48be880 00000001 d6607e10 000001ec 00000003 f88160f4 c48bea00
Call Trace:
  [<c015c07a>] bh_lru_install+0xba/0xf0
  [<c01b7f48>] flush_used_journal_lists+0xd8/0xf0
  [<c01bb5a4>] flush_old_journal_lists+0x44/0x60
  [<c01bbba2>] do_journal_end+0x5e2/0xa20
  [<c01ba085>] do_journal_begin_r+0x25/0x2d0
  [<c01407d0>] pdflush+0x0/0x30
  [<c01babd5>] journal_end_sync+0x55/0xa0
  [<c01a7c69>] reiserfs_sync_fs+0x69/0x80
  [<c011733c>] finish_task_switch+0x3c/0x90
  [<c01a7c98>] reiserfs_write_super+0x18/0x20
  [<c0160163>] sync_supers+0x93/0xa0
  [<c013fbc8>] wb_kupdate+0x28/0x110
  [<c01406e0>] __pdflush+0xc0/0x1b0
  [<c01407f6>] pdflush+0x26/0x30
  [<c013fba0>] wb_kupdate+0x0/0x110
  [<c01407d0>] pdflush+0x0/0x30
  [<c013105a>] kthread+0xba/0xc0
  [<c0130fa0>] kthread+0x0/0xc0
  [<c0101375>] kernel_thread_helper+0x5/0x10
Code: 04 89 0c 24 e8 d2 39 ff ff e9 bd fb ff ff 0f 0b 1c 05 cd ee 36 c0 e9 ff fe ff ff 89 1c 24 e8 
e8 2f 00 00 85 c0 0f 84 01 ff ff ff <0f> 0b 21 05 cd ee 36 c0 e9 f4 fe ff ff b8 60 51 37 c0 89 44 24


------- Additional Comment #1 From Robert Baxter 2005-06-04 11:07 PDT [reply] -------

before I upgrade the kernel, I figured it would be pertent to grab some more
info. This server IS rsync4.ca.gentoo.org I can't have it down for too too long. ;)

Portage 2.0.51.19 (default-linux/x86/2005.0, gcc-3.3.5-20050130,
glibc-2.3.4.20041102-r1, 2.6.11-gentoo-r6 i686)
=================================================================
System uname: 2.6.11-gentoo-r6 i686 Intel(R) Pentium(R) 4 CPU 3.00GHz
Gentoo Base System version 1.4.16
Python:              dev-lang/python-2.3.5 [2.3.5 (#1, Apr 28 2005, 03:07:48)]
dev-lang/python:     2.3.5
sys-apps/sandbox:    [Not Present]
sys-devel/autoconf:  2.59-r6, 2.13
sys-devel/automake:  1.7.9-r1, 1.8.5-r3, 1.5, 1.4_p6, 1.6.3, 1.9.5
sys-devel/binutils:  2.15.92.0.2-r7
sys-devel/libtool:   1.5.16
virtual/os-headers:  2.6.8.1-r1, 2.6.8.1-r2
ACCEPT_KEYWORDS="x86"
AUTOCLEAN="yes"
CFLAGS="-O3 -march=pentium4 -pipe -fomit-frame-pointer"
CHOST="i686-pc-linux-gnu"
CONFIG_PROTECT="/etc /usr/kde/2/share/config /usr/kde/3/share/config
/usr/share/config /usr/share/texmf/dvipdfm/config/
/usr/share/texmf/dvips/config/ /usr/share/texmf/tex/generic/config/
/usr/share/texmf/tex/platex/config/ /usr/share/texmf/xdvi/ /var/bind
/var/qmail/alias /var/qmail/control /var/vpopmail/domains /var/vpopmail/etc"
CONFIG_PROTECT_MASK="/etc/gconf /etc/terminfo /etc/env.d"
CXXFLAGS="-O3 -march=pentium4 -pipe -fomit-frame-pointer"
DISTDIR="/usr/portage/distfiles"
FEATURES="autoaddcvs autoconfig ccache distlocks sandbox sfperms strict"
GENTOO_MIRRORS="ftp://mirrors.tera-byte.com/pub/gentoo"
MAKEOPTS="-j2"
PKGDIR="/usr/portage/packages"
PORTAGE_TMPDIR="/var/tmp"
PORTDIR="/usr/portage"
SYNC="rsync://rsync4.ca.gentoo.org/gentoo-portage"
USE="x86 acpi apache2 avi bitmap-fonts bzip2 crypt curl emboss encode exif fam
flash foomaticdb gd gdbm gif gpm gtk2 imagemagick imap imlib jpeg libg++ libwww
mad maildir mikmod motif mp3 mpeg mysql ncurses nls nptl nptlonly ogg oggvorbis
pam pdflib perl png python quicktime readline samba sdl slang snmp spell sse ssl
tcpd tetex tiff truetype truetype-fonts type1-fonts userlocales vorbis xml2 xv
zlib userland_GNU kernel_linux elibc_glibc"
Unset:  ASFLAGS, CBUILD, CTARGET, LANG, LC_ALL, LDFLAGS, LINGUAS, PORTDIR_OVERLAY


------- Additional Comment #2 From Daniel Drake 2005-06-13 15:45 PDT [reply] -------

Is this reproducable or just a one-off?


------- Additional Comment #3 From Robert Baxter 2005-06-13 17:28 PDT [reply] -------

I haven't had it happen again, and can't seem to make it happen again either. It
was too long ago to remember what exactly the server was doing.


------- Additional Comment #4 From Daniel Drake 2005-06-26 02:40 PDT [reply] -------

OK, it is probably going to be hard to fix then, and might just have been a disk
hiccup or something.

Either way, you should mail this report to reiserfs-list@namesys.com incase they
can do something about it. I can't see anyone else who has reported the same BUG.


