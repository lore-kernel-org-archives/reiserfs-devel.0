From: Perry Kundert <perry.kundert@gmail.com>
Subject: Re: Less disk space with reiser4?
Date: Wed, 13 Apr 2005 12:32:54 -0600
Message-ID: <2f9ccaae05041311326ecd819c@mail.gmail.com>
References: <425A8A1D.9040206@siwnet.net>
	 <20050411195253.GD6211@backtop.namesys.com>
	 <425ADC6C.8090209@namesys.com> <425D15C1.6050107@siwnet.net>
	 <20050413130438.GM6211@backtop.namesys.com>
	 <425D21A6.10001@siwnet.net>
Reply-To: perry@kundert.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23869-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425D21A6.10001@siwnet.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Andersson <stefan@siwnet.net>
Cc: reiserfs-list@namesys.com

On 4/13/05, Stefan Andersson <stefan@siwnet.net> wrote:
> Alex Zarochentsev wrote:
>=20
> >On Wed, Apr 13, 2005 at 02:51:13PM +0200, Stefan Andersson wrote:
> >
> >
> >>Thanks for all the answers.
> >>
> >>Now would it be possible to change the 5% to something else?
> >
> >even if the fs would be unreliable?
> >
> That is what I want to test, or if someone knows the answer to that.
>=20

    I think claiming that the FS will become unreliable by choosing
some smaller amount of unused space, or making it a factor of total
RAM size instead of total File System size is a bit extreme...

    There must be some theoretical maximum limit on the number of
dirty blocks that can possibly be outstanding -- and I suspect that it
is more related to the total amount of RAM available, and NOT related
to the total size of the filesystem.  Proof:

    1) The number of dirty blocks is NOT limited to the RAM available
    2) That means that there exists a dirty block X, such that X is
considered dirty, but is not stored in available RAM
    3) Reductio as Absurdium.  Ergo, dirty blocks are limited to the
size of RAM.

    Now, there may be further constraints -- a contiguous segment of
sectors must be available (unlikely), some dirty blocks may require
more than one block on disk be available (unlikely), or some dirty
blocks in RAM may implicitly dirty one or more (additional) blocks in
the filesystem.

    Stilll, the "unused space" requirement would be constrained to
some multiple of RAM, NOT some percentage of the filesystem's size...

    Just a guess; sorry if I'm missing something obvious...

--
    -pjk


"If you will not fight when your victory will be sure and not too
costly, you may come to the moment when you will have to fight with
all the odds against you and only a precarious chance for survival.
There may even be a worse case. You may have to fight when there is no
hope of victory, because it is better to perish than to live as
slaves." -- Winston Churchill
