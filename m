From: Chris Mason <mason@suse.com>
Subject: Re: Chris: mason/patches/data-logging/experimental/2.6.1 upside
	down?
Date: Tue, 13 Jan 2004 23:11:42 -0500
Message-ID: <1074053501.32707.995.camel@tiny.suse.com>
References: <3171912.lEEDWjxvxS@spamfreemail.de>
	 <200401132247.05606.Dieter.Nuetzel@hamburg.de>
	 <31592854.1BIkuMAj52@spamfreemail.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16494-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <31592854.1BIkuMAj52@spamfreemail.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jens Benecke <jens-usenet@spamfreemail.de>
Cc: reiserfs-list@namesys.com

On Tue, 2004-01-13 at 17:13, Jens Benecke wrote:
> Dieter N=C3=BCtzel wrote:
>=20
> > See this, too.
> > Re: v3 logging speedups for 2.6
> > It's (SuSE 9.0 2.6.1) is running fine with reiserfs-journal-writer.
>=20
> I'll have a look.
>=20
> What exactly do experimental/2.6.1/journal-writer and logging.gz do /
> change / update? How experimental are they?
>=20

journal-writer isn't experimental at all, it just removes old debugging
code.  reiserfs-logging.gz is the first half of the 2.4.x data logging
code.  Basically the 2.4.x data logging patch had two parts, the first
part made small transactions significantly more efficient, and the
second part implemented data=3Dordered/data=3Djournal.

So, reiserfs-logging.gz has the small transaction performance
improvements, along with some other rewrites of how log blocks and
metadata get to disk.  In 2.4.x and vanilla 2.6, reiserfs keeps log
blocks and metadata pinned and then writes them out at very specific
times.  The new code keeps them pinned until they are safe to write, but
lets the system pdflush daemons do some of the writeback.

This makes for smoother io overall, since things aren't done in bursts.

-chris


