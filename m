From: berthiaume_wayne@emc.com
Subject: Data Shredding on a Journal Filesystem
Date: Tue, 24 Sep 2002 17:12:03 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049C0072@corpusmx1.us.dg.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C2640F.07C42FA0"
Return-path: <reiserfs-list-return-11521-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------_=_NextPart_000_01C2640F.07C42FA0
Content-Type: text/plain;
	charset="iso-8859-1"

	Hello fellow ReiserFS fans. I'm in search of a data shredder for use
on reiserfs and am wondering if anyone knows of one. It would need to
effectively remove any trace both in the journal and on the disk itself any
and all data pertaining to a file. I'm not sure, but I thought at one time
Hans was talking about something this himself. I have looked at shred() but
it does not work with journalling filesystems.
Most appreciatively,
Wayne



------_=_NextPart_000_01C2640F.07C42FA0--
