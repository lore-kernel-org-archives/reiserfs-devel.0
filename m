From: "Barry, Christopher" <cbarry@infiniconsys.com>
Subject: RE: reiserfs with mosix ?
Date: Mon, 14 Jul 2003 10:38:54 -0400
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB0179043E@mercury.infiniconsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14932-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>

Nope. You'll need Sistina's GFS for that. Also, do to locking semantics, =
I'm unsure of the effectiveness of this arrangement with Samba. You'll =
need to verify it with Sistina. Also, the power of MOSIX is in many =
small long-duration processes that can be migrated from the initial =
starting host to other MOSIX enabled machines. I'm not sure that the =
scenario you articulate would be a good fit for this. Possibly LVS or =
Heartbeat would be a better fit.

Regards,

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com



-----Original Message-----
From: ipguy [mailto:ipguy@optushome.com.au]
Sent: Monday, July 14, 2003 8:03 AM
To: reiserfs
Subject: reiserfs with mosix ?


hi all
i'm thinking of building a mosix cluster using the "reiserfs" and am
enquiring about weather the fs is able to be used as a global fs ?
specifically, i'm setting up two samba servers with a mosix cluster
connected to a single raid array..

-ipguy


