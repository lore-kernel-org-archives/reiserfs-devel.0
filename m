From: Hubert Chan <hubert@uhoreg.ca>
Subject: Compiling 2.6.15 with Reiser4 patch for 2.6.14
Date: Mon, 09 Jan 2006 22:39:57 -0700
Message-ID: <87y81ok5ea.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27649-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

The patch for 2.6.14 applies more or less cleanly (other than a few
already-applied chunks) to vanilla 2.6.15.  But when I compile, I get
errors:

  CC      fs/reiser4/jnode.o
fs/reiser4/jnode.c: In function 'jnode_by_page':
fs/reiser4/jnode.c:288: error: 'struct page' has no member named 'private'
fs/reiser4/jnode.c:289: warning: control reaches end of non-void function
fs/reiser4/jnode.c: In function 'do_jget':
fs/reiser4/jnode.c:603: error: 'struct page' has no member named 'private'
fs/reiser4/jnode.c: In function 'jnode_of_page':
fs/reiser4/jnode.c:644: error: 'struct page' has no member named 'private'
fs/reiser4/jnode.c: In function 'jnode_attach_page':
fs/reiser4/jnode.c:678: error: 'struct page' has no member named 'private'
fs/reiser4/jnode.c: In function 'page_clear_jnode':
fs/reiser4/jnode.c:695: error: 'struct page' has no member named 'private'
fs/reiser4/jnode.c: In function 'page_detach_jnode':
fs/reiser4/jnode.c:713: error: 'struct page' has no member named 'private'
make[4]: *** [fs/reiser4/jnode.o] Error 1

P.S. Have people who have tried the 2.6.14 patch found it to be fairly
reliable?

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

