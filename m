From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: 2.4.22pre7aa1 ;-) Mit O(1) aber leider kein pre-emption
Date: Tue, 22 Jul 2003 13:54:23 +0200
Message-ID: <200307221354.23397.Dieter.Nuetzel@hamburg.de>
References: <200307211639.32418.Dieter.Nuetzel@hamburg.de> <001c01c35012$abcc9250$2b8bddcb@lifebook>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <001c01c35012$abcc9250$2b8bddcb@lifebook>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Mueller <robm@fastmail.fm>, Chris Mason <mason@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Am Dienstag, 22. Juli 2003 07:32 schrieb Rob Mueller:
> > Data-logging in the works?
>
> I've managed to get this working. Patched to 2.4.22-pre7-aa and then
> applied the data logging patches for 2.4.22-pre5 (see
> ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.22) which
> seems to work fine. I saw two problems though, a function (can't remember
> which one) was duplicate defined in mm/filemap.c (exactly the same code
> appeared twice), and an EXPORT_SYMBOL() from mm/filemap.c had to be removed
> as well.

As always...;-)

> However removing them seemed to work fine.

I hoped that, but there is sadly no simple pre-emption patch for -aa.
With pre-emption I have much _more_ (IO-) throughput.

> The patches I applied:
>
> 04-reiserfs-sync_fs-4.diff
> 05-data-logging-39.diff
> 06-logging-export.diff
> 06-reiserfs-jh-3.diff
> 06-write_times.diff

Isn't needed 'cause it is in -aa.

> search_reada-5.diff

Thanks,
	Dieter

