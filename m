From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: Re: FIFO files
Date: Tue, 17 Jun 2003 19:54:39 +0200
Message-ID: <20030617175439.GA14881@chepelov.org>
References: <20030617162127.GA14124@chepelov.org> <3EEF40B3.6000300@gmx.net> <20030617170720.GC14124@chepelov.org> <20030617173946.GP15761@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14590-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030617173946.GP15761@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Tue, Jun 17, 2003, =E0 06:39:46PM +0100, Chris Dukes a =E9crit:

> A few thoughts.
> 1) Does it really need to be a single file?  Could a directory of files
> for each "transaction" suffice?

In theory, yes, in practice we got bitten going that road (especially since
while I'm wondering whether head-truncate could be added as a plug-in on
reiserfs4, the application is really running on <dirty>NTFS</dirty>).

> 2) Can the buffer be bounded?  If so, why not use a classic ring buffer?
	no			=09

> 3) If it can't be bounded, must it be simple file operations, or could
> you use something like sleepy cat's db4 or mysql?

Yes it must be simple file operations, so no a database engine is out of
question (DB4 might be simple enough, but sounds like massive overkill).

> Come to think of it, if sparse files are used you could have a classic ri=
ng
> buffer that is effectively unbounded.

True, as long as we are 100% sure the offsets aren't hitting some
implementation limit.=20

(given the patterns of use of the FIFOish buffer and the underlying OS, the
way I developed it, it's effectively a ring buffer with no bound, and a
"magic behaviour" that when the queue is empty, both pointers are reset to
the first position and the file is truncated. The situation where the hole
in front is significantly large is transient enough that making the file
sparse doesn't warrant the effort, waiting for a complete drain and the
eventual truncate takes care of space concerns).

The goal of my initial post was not to get someone to help me out of a
problem, but to learn whether the planned reiserfs4 plug-in system would
allow one to implement heterodox behaviours.

(it is true that a combination of sparse files + pointer-reset-on-drain
should bring a better solution, by removing the need for non-portable
extensions).

	-- Cyrille

--=20
