From: hanasaki <hanasaki@hanaden.com>
Subject: How do deal with : rebuild-tree gives "leaves all contents of which
 could not be,saved and deleted"?
Date: Thu, 29 Jun 2006 14:51:41 -0500
Message-ID: <44A42F4D.4000804@hanaden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28854-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Recently had to do a reboot and had not errors, just replayed
transactions at reboot.  Just to be safe, I rebooted into Knoppix 5.0x
and did a reiserfsck which reported there were errors that needed to be
fixed with --rebuild-tree  The failed output of this is below.  This has
happened quite often and I have done a full reinstall several times.
This is much more of an issue than ever was experienced with ext3 or
even ext2.

///////////

216224 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 1049994
                Leaves among those 44826
                        - corrected leaves 1
                        - leaves all contents of which could not be
saved and deleted 3
                Objectids found 215800

uname -a  <= a custom kernel from kernel.org download and build
Linux deskstation 2.6.17.1hanaden #1 SMP PREEMPT Wed Jun 28 18:34:21 CDT
2006 i686 GNU/Linux

Has been occurring with lower kernel numbers and those that come with
both Debian and Ubuntu
