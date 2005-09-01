From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 1 Sep 2005 18:23:44 +0200
Message-ID: <200509011823.44701.marcel@hilzinger.hu>
References: <20050901134604.31ddd297@SiRiUS.home> <43171D57.3030007@namesys.com> <431726F2.1090508@redhat.com>
Reply-To: marcel@hilzinger.hu
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25796-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431726F2.1090508@redhat.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Am Donnerstag, 1. September 2005 18:06 schrieb Peter Staubach:
> Hans Reiser wrote:
> >Research for filesystems generally says that as you get more than 85%
> >full the performance goes down, by a lot as you get close to 100%.  5%
> >is probably too little rather than too much.
>
> Wow.  What is all that space used for?  Other journalling file systems th=
at
> I have seen have limited things like journals to a much smaller space,
> expressed in megabytes, and a much smaller number than thought originally.
> The bigger journals just didn't end up adding to the performance measurab=
ly
> and were just considered to be a waste of space that could be used more
> usefully.
It's almost not for the journal.

AND

If you have a lot of small files, reiser4 manages space much better than ev=
ery=20
other filesystems. So the space you mean to loose with this 5% reiser4 give=
s=20
it back with better packaging, eg:

kernel 2.6.12 extracted:=20
with reiser4 ~ 200 MB
with ext3/reiserfs ~ 230 MB


=2D-=20
=DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
Marcel Hilzinger
