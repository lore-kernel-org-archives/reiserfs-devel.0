From: Sam Vilain <sam@vilain.net>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Thu, 13 Feb 2003 05:39:38 +1300
Sender: Sam Vilain <sv@horo.vilain.net>
Message-ID: <200302130539.38474.sam@vilain.net>
References: <NDBBJPAGKLCMDEIEKOPBKEKHKFAA.mailinglists@websitemanagers.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12721-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <NDBBJPAGKLCMDEIEKOPBKEKHKFAA.mailinglists@websitemanagers.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adam Goryachev <mailinglists@websitemanagers.com.au>, reiserfs-list@namesys.com

On Thu, 13 Feb 2003 00:12, Adam Goryachev wrote:
> I can conceive of a few things that *might* be the right thing in
> various circumstances:
>
> A) Immediately re-mount the drive read-only, and wait for the sysadmin
> to either re-mount rw or to do some other data recovery/repair
>
> B) Immediately dis-mount the drive and wait
>
> C) OK, I tried to write to sector 1324 so lets just try each consecutiv=
e
> available sector until it doesn't return an error (possibly marking the
> sectors bad/used as we go)
>
> D) Just return an error to the application

Or a mixture...

C) with a max limit of, say 5 attempts, then D).  And then, later if it=20
gets `really bad', where most I/O operations are failing, then A).

But I'd consider it acceptable behaviour for bounds check exceptions (ie,=
=20
unreported filesystem corruption) or situations where you have lost a=20
large amount of really critical structural information to invoke B).  Muc=
h=20
better than an Oops.

Whoever made that statement about the hard disk head crashing... now that=
's=20
certainly a laughable suggestion; a hard disk continuing after a head=20
crash.  If anything, my experience with disks has been that if they start=
=20
failing, you have to sort things out sooner rather than later.
--=20
Sam Vilain, sam@vilain.net

  You can judge your age by the amount of pain you feel when you come
in contact with a new idea.
JOHN NUVEEN
