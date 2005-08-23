From: Clemens Eisserer <linuxhippy@gmail.com>
Subject: Howto make reiser-3.6 a bit more standby friendly?
Date: Tue, 23 Aug 2005 14:39:15 +0200
Message-ID: <194f62550508230539a1c81d9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25618-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi there,

I am currently tinkering a idn-router which a harddrive which should
mostly be in stand-by.
However it seems the drive is rather unimpressed by a 5s timeout
setting specified with hdparm and goes in standby very seldom although
the computer is runnig 100% idle (even no isdn-services started or
anything else).

Could this be because of some journal-writeback stuff or anything like
that? Is there a way to tune ReiserFS for more standby-friendliness?

Thank you in advance, lg Clemens
