From: Nikita Danilov <Nikita@Namesys.COM>
Subject: reiser4 snapshot
Date: Tue, 23 Dec 2003 14:11:33 +0300
Message-ID: <16360.8933.883691.281877@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16387-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>, Reiserfs developers mail-list <Reiserfs-Dev@Namesys.COM>

Hello,

new reiser4 snapshot (for 2.6.0) is available at the

http://www.namesys.com/snapshots/2003.12.23/

See READ.ME file there for more instructions.

--------------------------------------------------------------------------------
WARNING: WARNING: WARNING: WARNING: WARNING: WARNING: WARNING: WARNING: WARNING:
Don't use Reiser4 in production environments. It is in the debugging stage.

--------------------------------------------------------------------------------
                                    Files:
--------------------------------------------------------------------------------

core.diff                   Modifications to the core part of the kernel
                            necessary for reiser4

reiser4.only.diff.gz        Reiser4 source code as -p1 patch for the kernel
                            source tree, compressed

all.diff.gz                 Above two patches combines and compressed

reiser4.tar.gz              Reiser4 source code. This also contains SCCS data.

broken-out                  core.diff split into separate patches

reiser4progs-0.4.20.tar.gz  reiser4progs: mkfs, fsck, etc.

libaal-0.4.15.tar.gz        libaal library required by reiser4progs

Nikita.
