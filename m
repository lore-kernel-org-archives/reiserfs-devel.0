From: Dennis Heuer <dh@triple-media.com>
Subject: linux 2.6.18, headers_install, and asm/unaligned.h
Date: Thu, 5 Oct 2006 15:17:20 +0200
Message-ID: <20061005151720.22b254c0.dh@triple-media.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30002-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello

I tried to install the newest reiserfstools on a pure x86_64 linux
2.6.18 system. The 64bit were not the problem but linux 2.6.18
has introduced 'make headers_install' and the header 'asm/unaligned.h'
is not installed by this. I got reiserfstools working via CFLAGS to
the linux source but you should possibly update reiserfstools to reflect
this change in strategy in the linux configuration system.

Regards,
Dennis
