From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Using fs views to isolate untrusted processes: I need an
 assistant architect in the USA for Phase I of a DARPA funded linux kernel
 project
Date: Mon, 02 Aug 2004 20:04:34 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <873c35nl2l.fsf@uhoreg.ca>
References: <410D96DC.1060405@namesys.com> <200408021112.08981.christian.mayrhuber@gmx.net>
 <87r7qpo3dj.fsf@uhoreg.ca> <410EBBD5.4080308@dgreaves.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19928-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "David" == David Greaves <david@dgreaves.com> writes:

David> It sounds like running exe's setgid (or addgid?) and then having acls.
David> But then the acls are not tied to the file objects, more appended
David> to the file acl list by 'pattern' according to the exe.

Possibly.  But, from my understanding of views, apache would not even
be able to see that /etc/passwd exists -- it is not just limited to not
being able to read it.  I don't think you can do that with acls, and
still allow apache to see some entries in /etc.

It also seems much easier to administer, since the permissions are tied
to the executable, rather than being tied to the file object.  (Say I
want to see what files apache can read as part of a security audit --
with acls, I would have to do a search over the whole filesystem.)

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

