From: David Greaves <david@dgreaves.com>
Subject: Re: Using fs views to isolate untrusted processes: I need an assistant
 architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Tue, 03 Aug 2004 09:30:21 +0100
Message-ID: <410F4D1D.8020406@dgreaves.com>
References: <410D96DC.1060405@namesys.com> <200408021112.08981.christian.mayrhuber@gmx.net> <87r7qpo3dj.fsf@uhoreg.ca> <410EBBD5.4080308@dgreaves.com> <873c35nl2l.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19931-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <873c35nl2l.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hubert Chan wrote:
|>>>>>"David" == David Greaves <david@dgreaves.com> writes:
|
|
| David> It sounds like running exe's setgid (or addgid?) and then
having acls.
| David> But then the acls are not tied to the file objects, more appended
| David> to the file acl list by 'pattern' according to the exe.
|
| Possibly.  But, from my understanding of views, apache would not even
| be able to see that /etc/passwd exists -- it is not just limited to not
| being able to read it.  I don't think you can do that with acls, and
| still allow apache to see some entries in /etc.

Given that you are extending the semantics then this is resolvable.

| It also seems much easier to administer, since the permissions are tied
| to the executable, rather than being tied to the file object.  (Say I
| want to see what files apache can read as part of a security audit --
| with acls, I would have to do a search over the whole filesystem.)

Yes, I understand - and agree.
Essentially there is an ACL set that lives with the exe.

I would expect this ACL set to be be normally deny based rather than
grant based?
Or could I grant write permission in the ACL set and override readonly
on the file ACL? That sounds unpleasantly interesting ;)

It seems to makes sense therefore to filter your audit based on the ACL
set and then you have to walk that tree to determine which file ACLs
grant what.

This solves the problem above - first check is the exe ACL set which
only has /etc/apache/* and so denies the existence of /etc/passwd

Note that /etc/ap* is essentially improving the granularity of +r on a
directory.

David
P.S. At this level of conversation, ACL may not mean posix acl - maybe
it should be access control mechanism for now - ACLs being a reasonable
first approximation.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBD00d8LvjTle4P1gRApycAJ0ZwAoGHV5GhL7R1dwU1gMhPC4AqgCfYs/3
jap29oSk8sKdhI2nd1bTvoo=
=25CC
-----END PGP SIGNATURE-----
