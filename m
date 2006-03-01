From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Re: Reiser4 default in Underground Dekstop distribution
Date: Thu, 2 Mar 2006 00:19:54 +0100
Message-ID: <200603020019.54410.marcel@hilzinger.hu>
References: <200602251203.09958.Peter.Foldiak@st-andrews.ac.uk> <200603012325.54461.marcel@hilzinger.hu> <44062587.9020005@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28181-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44062587.9020005@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Am Mittwoch, 1. M=E4rz 2006 23:51 schrieben Sie:
> Marcel Hilzinger wrote:
> >Am Sonntag, 26. Februar 2006 19:34 schrieb Peter Foldiak:
> >>Marcel (Hilzinger),
> >>
> >>Did you write this Linux Magazine article? Could you give some details =
on
> >>what the problem was?
> >
> >Yes, I wrote the article. The version I tested suffered much from the
> > fsync problem. There were timeouts approx every 10 seconds, where the
> > system didn't respond for a very short time (_very_ disturbing when
> > watching videos). I then asked the creator of Underground Linux if he
> > also had this problems and I pointet him to this list. He denied then,
> > but it seems that other users did report problems with underground 022 =
as
> > well. I didn't even know, that Underground went back to ReiserFS.
>
> Interesting.  The reason it is interesting is because I can only
> understand if it happened every 600 seconds due to an atom being
> expired.  If it happens every 10 seconds, then my next guess as to the
> culprit would be balance_dirty_pages, and perhaps entd doing too much
> work at a time.  I need more data, and the exact kernel version.  Hmm.
> Maybe Vitaly can try installing it and trying to reproduce.
>
> I assume a single cpu machine?  It would be interesting as a datapoint
> to know if the problem goes away with a 2 cpu machine.
Yes, it was a single CPU machine.  I observed the problem on a similar PC,=
=20
too.

Underground Linux 022 should still be available for download.

=2D-=20
=DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
Marcel Hilzinger
