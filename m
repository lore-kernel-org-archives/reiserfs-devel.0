From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Tree issues, fsck output
Date: Wed, 30 Jun 2004 12:03:22 +0300
Message-ID: <20040630090322.GM4990@nysv.org>
References: <20040629201956.GK4990@nysv.org> <20040630064547.GL4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19453-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040630064547.GL4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: sikkh@wp.pl

On Wed, Jun 30, 2004 at 09:45:47AM +0300, Markus T=F6rnqvist wrote:
>So now I'll just compile the new auto-snapshot and see what happens...

It did not work.

http://mjt.nysv.org/reiser/Reiser4-2004.06.29/
Pictures once again courtesy of my trusty phone, so the quality truly
does suck.

So, err, I'm doing a plain fsck now again, to see if that is the result
of some corruption, but it went to the extremely non-verbose semantic
tree pass...

I'm at a loss here, if the new kernel doesn't bother to boot and the
old one doesn't really work.

Vitaly, do you have some ideas for me? Do you want my metadata somewhere?

I doubt anyone checked yet if the mainline 2.6.7 port of the snapshot
I used was to blame, but at least now I'm trying with a standard one..

If the semantic tree pass goes cleanly and the fs is consistent, I will
try older auto-snapshots, despite the fact that the earlier mm's are
not highly recommended.

Thanks!

--=20
mjt

