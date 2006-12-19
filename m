From: Christian Trefzer <ctrefzer@web.de>
Subject: reiser4: data recovery after mkfs.reiser4?
Date: Tue, 19 Dec 2006 21:20:59 +0100
Message-ID: <20061219202059.GS10358@zeus.uziel.local>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30334-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi folks,

a buggy script I wrote dared to mkfs a reiser4 partition after failing
to properly tar up its contents - not that my life would depend on them,
but it would save me a few hours if I could get the stuff back.

Other than mkfs.reiser4, mount and unmount, nothing was done to the
device ; ) Is there any way to recover most of what was stored on the
now nuked fs?

TIA,
Chris

