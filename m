From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: data-logging on top of linux-2.4.19p7-compound-speedup-2.patch
Date: Mon, 20 May 2002 16:08:38 +0200
Message-ID: <200205201608.38375.Dieter.Nuetzel@hamburg.de>
References: <200205040219.42912.Dieter.Nuetzel@hamburg.de> <200205172204.22469.Dieter.Nuetzel@hamburg.de> <1021902370.22608.17.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10390-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1021902370.22608.17.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Monday 20 May 2002 15:46, Chris Mason wrote:
> On Fri, 2002-05-17 at 16:04, Dieter N=FCtzel wrote:
> > So data=3Djournal is very slow for me.
> > What's wrong?
>
> Nothing ;-)  data=3Djournal writes every data block twice, opnce to the
> log and once to the main disk.  Most of the time this makes things
> roughly 1/2 as fast as it was before.

That's good "news".

> The only time data=3Djournal helps is when you've got a very fsync or
> O_SYNC heavy application.

I were under the impression that I overlooked something.

>  Try running iozone with -o on both
> data=3Djournal and without it, data=3Djournal is 2 or 3 times as fast.

iozone3_98? What else?

> This is because we can do the sync by writing to the log instead of
> writing to the log and having to seek back to the main disk.

OK, know I'm enlightened ;-)

-Dieter
