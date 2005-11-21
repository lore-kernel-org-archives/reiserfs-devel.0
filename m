From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: need opinions from sysadmins on where reiser4progs should install
Date: Mon, 21 Nov 2005 02:33:36 -0500
Message-ID: <87y83isbe7.fsf@evinrude.uhoreg.ca>
References: <20051120040723.GA1392@148.Red-217-126-33.pooles.rima-tde.net.>
	<20051120115529.633B1177A@philou.gramoulle.local>
	<4381728D.7030300@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27044-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4381728D.7030300@namesys.com> (Hans Reiser's message of "Sun, 20
	Nov 2005 23:09:01 -0800")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Sun, 20 Nov 2005 23:09:01 -0800, Hans Reiser <reiser@namesys.com> said:

> Ok, I propose the following: search the standard locations for where
> it is currently, tell the user, ask the user if they want to rename
> those versions to *.old if the install of the new one succeeds, and
> then prompt for the install location with /sbin as the suggested
> default.

One possible problem: if, for example, a user has reiser4progs installed
as a Debian package, then the new (user-installed) version would be
overwritten if the reiser4progs Debian package gets updated.  Whether
this is the desired result (e.g. if the new Debian package is a newer
version of reiser4progs) or not (e.g. if the new Debian is just a minor
bugfix on the old version of reiser4progs), I don't know.

So if you choose to do this, you may want to include a warning about the
above case.  Users probably shouldn't try to have both the
distribution-packaged reiser4progs, along with a locally-compiled
version, at the same time.

> I think that unlike other user installed programs, fsck does not
> belong in /usr/local.

fsck, probably not.  mkfs, maybe.

Another option is to default to /usr/local, to satisfy the principle of
least surprise for administrators who expect all locally-compiled
programs to be in /usr/local, but emit a very loud warning that "this is
probably not really what you want to do, and should only continue with
/usr/local if you know what you are doing" for the following reasons:

- having old versions of reiser4progs could be dangerous
- fsck will not be available until after /usr/local is mounted
- /usr/local/sbin is usually not on root's $PATH
- ...

> I think Philippe's point that old versions are dangerous is quite
> valid.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

