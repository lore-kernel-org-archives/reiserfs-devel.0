From: Chris Mason <mason@suse.com>
Subject: reiserfs logging patches udpated
Date: Wed, 24 Mar 2004 12:29:59 -0500
Message-ID: <1080149399.14737.77.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, akpm@osdl.org

Hello everyone,

ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.5-rc2-mm2

Has a new set of reiserfs patches.  These should also work on 2.6.5-rc2,
but I did testing on top of -mm2 because I'm submitting part of the
patch set to Andrew.

New since the 2.6.4 code:

- add reiserfs laptop mode support
- removed patches that made it into mainline
- fixed buffer refcount problem in reiserfs-writepage-ordered-race when 
block size < page size
- fix buffer head leak in my invalidatepage func
- fix bogus warning message about locked buffers during logging

The series file has the list of the patches in the order they should be
applied.

Andrew, this subset is ready for testing -mm.  It's everything except
the xattr and ACLs, I'm still trying to convince Hans those should go
in.

reiserfs-nesting-02
reiserfs-journal-writer
reiserfs-logging
reiserfs-jh-2
reiserfs-prealloc
reiserfs-tail-jh
reiserfs-writepage-ordered-race
reiserfs-file_write_hole_sd.diff
reiserfs-laptop-mode
reiserfs-truncate-leak
reiserfs-ordered-lat
reiserfs-dirty-warning

-chris


