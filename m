From: "Burnes, James" <james.burnes@gwl.com>
Subject: RE: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 11:16:39 -0700
Message-ID: <3DF9165145FACB4C96977FF650C1E90411F73702@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Esben Stien <b0ef@esben-stien.name>, sander@humilis.net
Cc: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

> We got pretty good tools to restore from a hd with bad blocks.
>=20
> dd it, loop it, fsck it.

Heh, heh.  That won't help you if a circuit board, spindle, read head or
other mechanism fails.  Then you better hope the data wasn't *that*
valuable or you know good platter recovery shop.

Backups are cheap.  Recovery is very expensive.  Ask the CIA ;-)

It's Hans and friend's responsibility to patch whatever looks like a
serious problem.  It's the user's responsibility to protect valuable
data.
File system reliability after that is really a question of operational
downtime expenses etc.

If people don't trouble themselves to perform backups:

1. They have accepted that risk or
2. They are too junior to have ever lost a couple months worth of work
because they were too lazy or inexperienced to perform backups.
3. They don't have any work that can't be rebuilt in a matter of hours
(see #1).

(BTW: If Hans is a little tired of working on Reiser3 it's probably
because he is currently stressed out making last minute tweaks on
Reiser4 and managing his team.

Cut him some slack.  Email conversations don't show a number of things
we take for granted, like that fact that the person we're talking to
looks really tired etc.  Unlike ext3, XFS and JFS, Reiser isn't funded
by someone with huge pockets.)

Jim Burnes



