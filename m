From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas
 thread)
Date: Mon, 12 Apr 2004 12:00:37 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <874qrpkwyi.fsf@uhoreg.ca>
References: <407AB9AE.3060801@pobox.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17871-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

XML namespaces seems like overkill to me, but I'll let someone more
qualified say something more intelligent.  I just have one other
comment.

>>>>> "John" == John D Heintz <jheintz@pobox.com> writes:

[...]

John> Other namespaces could be added to files/directories and I'd
John> assume something like: `cat foo.txt/reiser4:namespaces` would list
John> all the namespaces available for a particular file.  Something
John> like:
John> reiser4 http://www.namesys.com/v4
John> streams http://www.evil-empire.com/streams
John> snapcm http://www.snapcm.com/snapcm

It's probably better to do:

# ls foo.txt/reiser4:namespaces
reiser4
streams
snapcm
# cat foo.txt/reiser4:namespaces/reiser4
http://www.namespaces.com/v4

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

