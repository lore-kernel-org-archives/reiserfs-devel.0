From: Oleg Drokin <green@namesys.com>
Subject: reiserfsprogs 3.6.7 release
Date: Thu, 1 May 2003 20:15:11 +0400
Message-ID: <20030501161511.GA15766@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13913-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com, ed@debian.org

Hello!

   Sigh, this is the out-of-schedule bugfix release that we release
   because reiserfsprogs-3.6.5 and reiserfsprogs-3.6.6 introduced one additional
   check that is not necessary, but breaks on old filesystems (the journal
   parameters check) and lots of users are affected.
   The only change in this release compared to 3.6.6 is changing the check
   to be only performed in case of relocated journal.

   Grab it from ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.7.tar.gz

   If you are just a user, you might want not to grab this release because you have
   rebuilt your superblock most probably. If you are representing a distro, and
   you are shipping/planning to ship reiserfsprogs-3.6.[56], you need this
   release instead.

   This change was sent to some people already (namely to Ed Boraas), but it turned out
   the patch was against wrong tree and did not apply to reiserfsprogs-3.6.6 at all.

   Sorry for all the confusion.

   (And reiserfsprogs-3.6.7-pre1 is still the latest code in fact, Vitaly might release it
    as reiserfsprogs-3.6.8-pre1 after May 11th, when all these long boring russian
    holidays are over)

Bye,
    Oleg
