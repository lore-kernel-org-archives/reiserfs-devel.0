From: Bram Stolk <bram@sara.nl>
Subject: rebuilding tree of root fs
Date: Thu, 17 Oct 2002 10:26:45 +0200
Message-ID: <20021017102645.1c56dedb.bram@sara.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11718-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

My reiserfs filesystem is damaged.
When I run reiserfsck, it reports that '--rebuild-tree' is required.

However, if I add the --rebuild-tree, reiserfsck refuses to continue
because the fs cannot be mounted.

Unfortunately, the fs is my root fs, so it cannot be unmounted.

How can I solve this?
This is on a notebook, which has a USB floppy, so maybe that can
be used somehow? Are there floppy disks with reiserfsck tools 
available?

Thanks,

  Bram Stolk

-- 
------------------------------------------------------------------------------
 Bram Stolk, VR Specialist.
 SARA Academic Computing Services Amsterdam, PO Box 94613, 1090 GP  AMSTERDAM
 email: bram@sara.nl   Phone +31-20-5923059  Fax +31-20-6683167

 "I heard if you play the NT-4.0-CD backwards, you get a satanic message."
 "Thats nothing, if you play it forward, it installs NT-4.0"
------------------------------------------------------------------------------
