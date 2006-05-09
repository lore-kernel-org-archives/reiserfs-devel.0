From: Henti Smith <henti@geekware.co.za>
Subject: bug when accessing files .
Date: Tue, 9 May 2006 17:58:30 +0200
Message-ID: <20060509175830.5d093df7@yoda.foad.za.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28598-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all. 

I'm getting kernel BUG error when accessing a set of files on my FS. 

Here is the kernel output. 

------------[ cut here ]------------
kernel BUG at fs/reiserfs/journal.c:2809!
invalid operand: 0000 [#1]
PREEMPT SMP
Modules linked in:
CPU:    0
EIP:    0060:[<c01bc0e3>]    Not tainted VLI
EFLAGS: 00010246   (2.6.12-gentoo-r6)
EIP is at journal_begin+0xe3/0xf0
eax: 00000000   ebx: cba3dea8   ecx: cba3def8   edx: dfd22c00
esi: cba3def8   edi: cba3c000   ebp: dfd22c00   esp: cba3de68
ds: 007b   es: 007b   ss: 0068
Process mc (pid: 6112, threadinfo=cba3c000 task=dba120a0)
Stack: 00000000 ffffffff 00000000 00000000 d520c80c d520c80c 00000000 
cba3dea8
       c01aa029 cba3dea8 dfd22c00 00000012 00000000 cdff3000 00000000 
00000000
       00000000 00000000 00000000 e09c2000 cba3def8 00000000 cba3def8 
cba3df68
Call Trace:
 [<c01aa029>] remove_save_link+0x39/0x110
 [<c01bc457>] journal_end+0xa7/0x100
 [<c019ca2c>] reiserfs_delete_inode+0xcc/0xe0
 [<c019c960>] reiserfs_delete_inode+0x0/0xe0
 [<c0172bd3>] generic_delete_inode+0x73/0x110
 [<c0172e32>] iput+0x62/0x90
 [<c016855d>] sys_unlink+0x10d/0x140
 [<c0102e05>] syscall_call+0x7/0xb
Code: 74 29 40 b9 09 00 00 00 89 df 89 46 04 f3 a5 83 7b 04 01 7e 04 31 
c0 eb c9 c7 44 24 04 60 e4 39 c0 89 2c 24 e8 1f 0f ff ff eb ea <0f> 0b 
f9 0a 48 3c 39 c0 eb cd 8d 76 00 55 31 ed 57 56 53 83 ec

Machine information : 

Gentoo info since it usually has some handy bits of info :P 

Portage 2.0.53 (default-linux/x86/2005.0, gcc-3.2.3,
glibc-2.3.4.20041102-r1, 2.6.12-gentoo-r6 i686)
=================================================================
System uname: 2.6.12-gentoo-r6 i686 Pentium III (Coppermine) Gentoo
Base System version 1.4.16 dev-lang/python:     2.2.3-r1, 2.3.5
sys-apps/sandbox:    1.2.10
sys-devel/autoconf:  2.13, 2.59-r6
sys-devel/automake:  1.4_p6, 1.5, 1.6.3, 1.7.9-r1, 1.8.5-r3, 1.9.5
sys-devel/binutils:  2.15.92.0.2-r7
sys-devel/libtool:   1.4.3-r1, 1.5.16
virtual/os-headers:  2.4.19-r1, 2.6.8.1-r2
ACCEPT_KEYWORDS="x86"
AUTOCLEAN="yes"
CBUILD="i686-pc-linux-gnu"
CFLAGS="-O3 -march=pentium3 -fprefetch-loop-arrays -funroll-loops -pipe"
CHOST="i686-pc-linux-gnu"
CONFIG_PROTECT="/etc /usr/kde/2/share/config /usr/kde/3.3/env /usr/kde/3.3/share/config /usr/kde/3.3/shutdown /usr/kde/3/share/config /usr/lib/X11/xkb /usr/share/config /var/qmail/control"
CONFIG_PROTECT_MASK="/etc/gconf /etc/terminfo /etc/env.d"
CXXFLAGS="-O3 -march=pentium3 -fprefetch-loop-arrays -funroll-loops
-pipe" DISTDIR="/usr/portage/distfiles"
FEATURES="autoconfig distlocks sandbox sfperms strict"
GENTOO_MIRRORS="ftp://ftp.is.co.za/linux/distributions/gentoo
http://gentoo.oregonstate.edu/
http://www.ibiblio.org/pub/Linux/distributions/gentoo" MAKEOPTS="-j3"
PKGDIR="/usr/portage/packages" PORTAGE_TMPDIR="/var/tmp"
PORTDIR="/usr/portage"
SYNC="rsync://rsync.gentoo.org/gentoo-portage"
USE="x86 acl apm arts audiofile avi berkdb bitmap-fonts bzip2 crypt
curl eds emboss encode expat foomaticdb fortran gdbm gif gmp gpm
gstreamer gtk2 idn imlib ipv6 java jpeg kde lcms libg++ libwww mad
mikmod mng motif mp3 mpeg ncurses nls ogg oggvorbis opengl oss pam pcre
pdflib perl png quicktime readline samba sdl slang spell ssl tcpd tiff
truetype truetype-fonts type1-fonts udev vorbis winbind xmms xv zlib
userland_GNU kernel_linux elibc_glibc" Unset:  ASFLAGS, CTARGET, LANG,
LC_ALL, LDFLAGS, LINGUAS, PORTDIR_OVERLAY

after the error all disk acces is dead .. and machine has to be reset. 

I'm busy upgrading to latest kernel to see if this solves the problem .. 
will also get latest version of reiserfsck and scan drive just in case. 

-- 
Henti Smith
henti@geekware.co.za
+27 82 958 2525
http://www.geekware.co.za

DISCLAIMER : 

Unauthorised use of characters, images, sounds, odors, severed limbs,
noodles, wierd dreams, strange looking fruit, oxygen, and certain parts
of Jupiter are strictly forbidden.  If I find you violating, or
molesting my property in any way, I will employ a pair of burly
convicts to find you, kidnap you, and perform god-awful sexual
experiments on you until you lose the ability to sound out vowels.  I
don't know why you are still reading this, but by doing so you have
proven that you have far too much time on your hands, and you should go
plant a tree, or read a book or something.
	- http://www.ctrlaltdel-online.com/
