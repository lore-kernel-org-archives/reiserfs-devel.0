From: Clemens Eisserer <linuxhippy@gmail.com>
Subject: Re: Howto make reiser-3.6 a bit more standby friendly?
Date: Tue, 23 Aug 2005 21:10:03 +0200
Message-ID: <194f625505082312106ecac3b6@mail.gmail.com>
References: <194f62550508230539a1c81d9@mail.gmail.com>
	 <430B31E4.6080807@slaphack.com>
	 <194f625505082308514acb124f@mail.gmail.com>
	 <200508231838.37372.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25628-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200508231838.37372.chrivers@iversen-net.dk>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi Christian,

> Are you sure? Common "knowledge" (empiric and anecdotal evidence) says th=
at a
> spin-up/spin-down cycle costs significantly more "lifetime" than running =
the
> drive for the same amount of time. You really have to have extremely few
> spin-ups for this to have any positive effect, IMHO.

Never really thought about that but the machine acts as server only
during the day but also runs at night - at that time nothing at all is
done with the box so I thought it would be better to send the drive to
sleep overnight.

Thanks for this thought - I'll adjust the settings via a cron-daemon
so that the drive does not have to do unesscesary spin-ups during use.

lg Clemens
