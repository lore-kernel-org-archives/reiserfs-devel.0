From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Tree issues, fsck output
Date: Wed, 30 Jun 2004 13:24:34 +0400
Message-ID: <200406301324.34713.vitaly@namesys.com>
References: <20040629201956.GK4990@nysv.org> <20040630064547.GL4990@nysv.org> <20040630090322.GM4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19455-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040630090322.GM4990@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?q?T=F6rnqvist?= <mjt@nysv.org>, reiserfs-list@namesys.com
Cc: sikkh@wp.pl

On Wednesday 30 June 2004 13:03, Markus T=F6rnqvist wrote:
> On Wed, Jun 30, 2004 at 09:45:47AM +0300, Markus T=F6rnqvist wrote:
> >So now I'll just compile the new auto-snapshot and see what happens...
>
> It did not work.
>
> http://mjt.nysv.org/reiser/Reiser4-2004.06.29/
> Pictures once again courtesy of my trusty phone, so the quality truly
> does suck.
>
> So, err, I'm doing a plain fsck now again, to see if that is the result
> of some corruption, but it went to the extremely non-verbose semantic
> tree pass...

it prints all found corruptions. could you send them ?

btw, I hvae already added gauge to the semantic pass. Hopefully will
release another progs snapshot or internal-snapshot on days.

> I'm at a loss here, if the new kernel doesn't bother to boot and the
> old one doesn't really work.

if I recall correctly the only corruption was wrong directory entry, right?
or it fould some more while you were sleeping?

> Vitaly, do you have some ideas for me? Do you want my metadata somewhere?

could you run fsck.reiser4 in check mode again after rebuilding to be sure =

that evth has been fixed. If you have matadata packed before rebuilding,=20
not after, and you can provide them for downloading, it would be useful.

> I doubt anyone checked yet if the mainline 2.6.7 port of the snapshot
> I used was to blame, but at least now I'm trying with a standard one..
>
> If the semantic tree pass goes cleanly and the fs is consistent, I will
> try older auto-snapshots, despite the fact that the earlier mm's are
> not highly recommended.

to reproduce this we need to know which steps lead to such corruptions.

--=20
Thanks,
Vitaly Fertman

