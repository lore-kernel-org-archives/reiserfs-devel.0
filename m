From: "Burnes, James" <james.burnes@gwl.com>
Subject: New server Reiser4 or 3, also Reiser4 on software RAID
Date: Thu, 15 Apr 2004 12:36:59 -0600
Message-ID: <3DF9165145FACB4C96977FF650C1E9040C469E0D@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17968-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm installing a new R&D server and I'd like to eventually run Reiser4
on it, but I'd like to wait until I test it some more before I deploy it
on the entire machine.

Here is what I'd like to do:

1. Install Reiser3 (perhaps with some of the anti-fragmentation
patches).
2. Since I'll be installing UML on the machine, run V4 on some virtual
machines until I'm comfortable.
3. Upgrade the rest of the system to V4.

In other words, if I bring the machine down to single user, is there a
straightforward way that I can upgrade a Reiser3 fs to version 4?  I
don't remember this being in a FAQ or anything, sorry if I missed it.

I was also considering that this is a non-production machine, so perhaps
installing V4 would be okay and then just take my lumps and backup
regularly ;-)  Also, this machine have to come up tomorrow so I have a
little breathing room.

Your comments appreciated. =20

jim burnes
security engineer
great-west, denver
=20

