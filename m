From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: New dpkg panic.
Date: Mon, 6 Dec 2004 17:31:16 +0200
Message-ID: <20041206153115.GV26192@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22690-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello

How ironic; dpkg broke again..

The kernel in question is 2.6.9, with reiser4-for-2.6.9-2:

I noticed it first when my kernel, basically -cko3 with reiser4 replaced
with the new version, hung when I tried to install iconbar of enlightenment
on my Debian box, with x.org taken from Ubuntu.

It hung on trying to get the list of files for xorg-common, and with
debugging it panicked.

I did an mv  on the file and tried to reinstall xorg-common, but it didn't
help. It had a file called xorg-common.list-new which I tried to open
with less but that process died as well. (Uninterruptible Sleep D+)

I have the logs here:
http://mjt.nysv.org/reiser/2004.12.06.forensics/

In the first file I had renamed the list file and cat on that triggered
the panic, after which I rebooted just fine.

In the second file I did dpkg -i three times (my comments are there,
and I didn't write the entire file name of xorg-common)

The third file is me fooling around and addiong comments to the netconsole
output as I go along until the system panicked and needed a power-button 
boot.

What I'm puzzled about is why this comes for different programs?
Is my physical fs on the disk broken?

I'd appreciate a prompt answer, so I can fsck my computer as fast
as possible if that's needed...

Spatsibo and thanks!

-- 
mjt

