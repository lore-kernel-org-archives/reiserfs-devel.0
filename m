From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Re: More Slowdown
Date: Tue, 22 Nov 2005 16:01:46 +0100
Message-ID: <200511221601.47095.marcel@hilzinger.hu>
References: <200511171447.41362.mail@earthworm.de> <200511221144.34541.marcel@hilzinger.hu> <43832B3B.8070802@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27075-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43832B3B.8070802@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Am Dienstag, 22. November 2005 15:29 schrieb David Masover:
> Marcel Hilzinger wrote:
[...]
> > It's not about Debian or Suse. It's about kernel 2.6.13 or 2.6.14. At
> > least it seems, that the problem does not appear on older kernels
> > (right?)
>
> Wrong.
>
> You are talking about the fsync issue, right?  As far as I know, while
> there has been progress lately, fsync has always been slow on Reiser4,
> because until recently, it was basically a call to sync, and reiser4
> syncs can be huge due to lazy writes -- stuff only ever hits disk when
> there's nowhere else to put it in RAM.  Actual calls to sync are rare
> enough (shutdown/reboot) that lazy writes are a good thing, but fsync
> apparently needs to be faster.
>
> I disabled fsync before the FS was even stable, because I was sick of
> waiting 30 seconds or so for vim to save and quit.
>
> It may help to have fsync only sync the file in question (as it always
> has, except on Reiser4).  This has been done with lazy writes, in XFS,
> so I see no reason it can't be done here -- there might have even been a
> patch recently.  Personally, I'd like to see it stay as slow as it is
> for awhile, so we can find the people doing stupid things (evolution)
> and flame them into crispy obediance.
>
> fsync means flush to disk.  This is something you're supposed to do with
> a file when the file is so important you want to guarentee you'll have
> the most recent, uncorrupted version after a crash.  If evolution is
> calling fsync while resizing, this is an evolution bug, made more
> obvious by reiser4 -- if a computer crashes, does the user really care
> if their Evolution columns are still lined up _exactly_ the way they
> were (maybe mid-click'n'drag) when the crash occurred?
Thanks a lot. I understand now. But is there any bug to hunt within reiser4=
=20
then?

=2D-=20
=DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
Marcel Hilzinger
