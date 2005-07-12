From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH/SCRIPT] reiserfs: run scripts/Lindent on reiserfs code
Date: Tue, 12 Jul 2005 19:24:12 -0400
Message-ID: <20050712232412.GA9669@locomotive.unixthugs.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="vkogqOf2sHV7VnPd"
Return-path: <reiserfs-list-return-25112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


The attached script runs scripts/Lindent against fs/reiserfs.c and
include/linux/reiserfs_*.h

It's a quick one-liner consisting of:

scripts/Lindent fs/reiserfs/*.c include/linux/reiserfs_*.h

-Jeff

-- 
Jeff Mahoney
SuSE Labs

--vkogqOf2sHV7VnPd
Content-Type: application/x-sh
Content-Disposition: attachment; filename="reiserfs-lindent.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/sh=0A=0Ascripts/Lindent fs/reiserfs/*.c include/linux/reiserfs_*.h=0A
--vkogqOf2sHV7VnPd--
