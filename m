From: berthiaume_wayne@emc.com
Subject: RE: power loss -> corruption
Date: Thu, 8 May 2003 08:23:38 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D007AA853B@corpusmx1.us.dg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14006-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: mirar-yg@mirar.org, Dieter.Nuetzel@hamburg.de
Cc: reiserfs-list@namesys.com

	"data=3Djournal" will also work. You'll need to use the data logging
patches that Chris Mason has put together.=20

-----Original Message-----
From: Mirar [mailto:mirar-yg@mirar.org]
Sent: Thursday, May 08, 2003 8:07 AM
To: Dieter N=FCtzel
Cc: reiserfs-list@namesys.com
Subject: Re: power loss -> corruption


> Maybe, if you have some more details.

How do I get the necessary details?

> data-logging patches and mount option "data=3Dordered" solved similar
> problems for me.

Which patches? I'll add "data=3Dordered" to see if it'll help.

/Mirar
