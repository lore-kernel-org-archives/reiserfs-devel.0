From: frbiscani@jumpy.it
Subject: Re: reiser4 - Non-removable files in lost+found
Date: Mon, 18 Oct 2004 15:50:33 +0200
Message-ID: <40FC740900080188@mail13.jumpyint.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22091-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Michael Weissenbacher <webmaster@dermichi.com>, ReiserFS List <reiserfs-list@namesys.com>

Sorry for the mail-mess... I hate webmail :/

On Friday 15 October 2004 14:29, Vitaly Fertman wrote:
> On Friday 15 October 2004 12:07, Michael Weissenbacher wrote:
> >
> > had the same problem, it is related to fsck which computes hashes the=

> > wrong way if filenames are too long (and/or contain non-ascii
> > characters). vladimir sent a patch to the mailing list that corrected=

> > this bug for me. not sure if this is already available in the
> > pre-version of reiser4progs.
>
> yes, the fix is included into reiser4progs-1.0.2-pre1.

Thank you all for the feedback. I installed reiser4progs-1.0.2-pre1 and
it 
found the same number of corruptions as the number of undeletable files

in /lost+found. Should I run fsck with --build-fs then? Also, can this be=


done when the partition is mounted read-only? I'm asking this because I
have to run reiser4progs from a chrooted environment where my / partition=

is mounted read-only.

Thanks again,

  Francesco

________________________________________
Crea la tshirt con il tuo nick! http://www.mediasetshop.it/JumpyChat/


