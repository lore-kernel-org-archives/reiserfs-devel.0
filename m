From: "Richard Heycock" <rgh@roughage.com.au>
Subject: Help I just destroyed my Root filesystem
Date: Fri, 13 Jun 2003 11:05:07 +1000 (EST)
Message-ID: <32822.203.217.69.236.1055466307.squirrel@webmail.bandcamp.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14524-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm new to this list and I need some help! I just ran grub-install on my
root partition instead of my boot partition and it appears to have wreaked
it. If I run file -s /dev/hda5 I now get 'x86 boot sector' instead of
'ReiserFS V3.6 block...' and I can no longer mount it.
When the machine tries to boot it loads the kernel (from /dev/hda6) but
when it comes to mount the root partition it kernel panics as it cannot
mountthe filesystem.

I know at least some of the data is on the partition (`less /dev/hda5`).
I'm guessing that grub-install has overwritten N number of bytes at the
beginning of the partition but beyond that I'm at a complete loss of what
to do.
Help!

Thanks

rgh



