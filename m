From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Subject: Re: On a free repacker
Date: Mon, 24 May 2004 23:23:00 +0200
Message-ID: <40B267B4.6060002@gmx.net>
References: <20040519192831.GL24604@nysv.org> <200405201028.13184.reiser@namesys.com> <20040520184054.GR24604@nysv.org> <40AEBBA0.6060606@namesys.com> <20040521184451.GS24604@nysv.org> <200405211902.i4LJ25RI016978@turing-police.cc.vt.edu> <20040524203016.GA4990@nysv.org> <40B25DF0.2090400@gmx.net> <20040524204751.GC4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040524204751.GC4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Valdis.Kletnieks@vt.edu, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:
> On Mon, May 24, 2004 at 10:41:20PM +0200, Carl-Daniel Hailfinger wrote:

Note: Lines starting with "user@linux:~>" are lines you have to type in
into your shell.

To get a local copy of a repository not yet on your disk:
user@linux:~> bk clone bk://some.url/of/the/project
and you have a directory "project" containing all the files you need.

To get the latest revision from the upstream repository, just issue
user@linux:~> bk pull
inside the project directory and your sources will be updated to the
latest version available upstream.

For consistency it might be advisable to add the following line to your
/etc/BitKeeper/etc/config file:
checkout: get


> I think this script is pretty much fubar :)

That was not a script. It was a collection of the most needed commands if
you want to follow a development tree. And it is definitely not python.
I'm used to mark commands with a leading "#" and not tag comments at all.
I now have tried to make the above more clear. Better?


> Oh, and mjt.nysv.org is down, don't even try to download this or anything
> else, it will fail.[1]
>=20
>=20
>>Can it get simpler than this? I'm truly interested in anything that makes
>>my life simpler.
>=20
>=20
> Lots of switches which affect what is transferred. That may be versatility
> but I think it's useless. SVN is just svn update and there you have it.

Wait. If I do not have the repository on my disk, svn update will get me
the whole repository fully checked out?


> That is achieved with clone, pull and -r get in BK.
> How does BK do diffs? SVN is svn diff -r145:146 and it's there.

That depends. I do not know what svn diff does. Assuming it takes file
revision numbers, the following command in bk will work:
bk diffs -r1.45..1.46

If you want a diff of two different tree revisions against each other:
bk export -tpatch -r1.45,1.46


> SVN's bigger problem seems to be that files are actually copied when
> they're tagged. I love that, but I could see it flooding the hard drive.

That is a cool feature.

> Apparently they're just tagged in the server-side database, but it's
> transparent copying.
>=20
> That's a fair trade-off for anything CVS can throw at me ;)

Hey, everything is better than CVS. It was so complicated that after
having tried it (and having invested days into learning it properly), I
decided to go back to regular diffs and tarballs. And that was for a
project which was already managed inside CVS, but it had to track the
kernel (back when the kernel existed only as tarballs and patches). The
mantenance headache for me was big enough to give up on CVS.


> I have to admit, though, that I lack experience in BK, and may find the
> options, switches and knobs simpler if I got into it. But I don't see
> the need...

You're right about the need. Time can be spent better than learning yet
another revision control system.


Regards,
Carl-Daniel
--=20
http://www.hailfinger.org/
