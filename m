From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: SuSE 9.0 reiserfsprogs-3.6.9. When will we see an update?
Date: Mon, 8 Dec 2003 21:39:38 +0100
Message-ID: <200312082139.38178.Dieter.Nuetzel@hamburg.de>
References: <200312011931.01285.Dieter.Nuetzel@hamburg.de> <1070915083.10849.38.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070915083.10849.38.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Chris Mason <mason@suse.com>
Cc: ReiserFS-List <reiserfs-list@namesys.com>

Am Montag, 08. Dezember 2003 21:24 schrieb Chris Mason:
> On Mon, 2003-12-01 at 13:31, Dieter N=FCtzel wrote:
> > Hello Chris,
> >
> > some time has passed...;-)
> >
> > I had a bad system corruption due to a broken system disk. My IBM U160
> > disk (DDYS-T18350; 18,2 GB; 10k RPM) was broken for the third time... N=
ow
> > I replaced it with two (RAID1) Fujitsu MAS3184NP (U320; 18,4 GB; 15k RP=
M;
> > 65-78 MB/s (inner to outer)) and SUSE 9.0 on LVM.
> >
> > After a power loss I got some files in "lost+found" from "/opt" (last
> > accessed) and reiserfsck was relative slow (reiserfsprogs-3.6.9).
> > Reiserfsprogs-3.6.11 and -pre12 is way faster (on my old SuSE7.3 based
> > system) and there where some fixes.
> >
> > I tried to compile them on SuSE 9.0 as always but I failed 'cause SuSE
> > patched some things.
>
> Hmmm, did you try the 9.0 reiserfsck?  It actually does include most of
> 3.6.11.

Ah, but yes, it was the 9.0 reiserfs-3.6.9-33 version.

=2DDieter
