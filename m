From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Tue, 30 Mar 2004 21:50:23 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87hdw5vifk.fsf@uhoreg.ca>
References: <20040330123546.GA5229@nysv.org> <200403301513.01851.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17608-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Christian" == Christian Mayrhuber <christian.mayrhuber@gmx.net> writes:

Christian> What about introducing an separator for meta information,
Christian> like it is / for directories.  This separator could be turned
Christian> into a mount option to avoid breakage of some apps.

Christian> My suggestion is "@" to become the default separator, because
Christian> XPath uses it for attributes and it is THE accepted standard
Christian> so far.  Filesystems are just a new domain. ...

That effectively kills all filenames that contain @, much worse than
just a "metas" conflict IMHO.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

