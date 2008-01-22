From: "Hemmann, Volker Armin" <volker.armin.hemmann@tu-clausthal.de>
Subject: Re: bug report: reiser4 + kde4
Date: Tue, 22 Jan 2008 04:00:49 +0100
Message-ID: <200801220400.50172.volker.armin.hemmann@tu-clausthal.de>
References: <20071122101615.178410@gmx.net> <200801181830.55677.volker.armin.hemmann@tu-clausthal.de> <47953052.80500@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47953052.80500@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, Mat <jackdachef@gmail.com>

On Dienstag, 22. Januar 2008, Edward Shishkin wrote:
> Hemmann, Volker Armin wrote:
> >On Freitag, 18. Januar 2008, you wrote:
> >>Hemmann, Volker Armin wrote:
> >>>On Montag, 17. Dezember 2007, Edward Shishkin wrote:
> >>>>I have some progress in installing kde4 on my box ;)
> >>>>Hope I'll able to reproduce it.
> >>>
> >>>any progress on this bug?
> >>
> >>Not yet.
> >>Is it possible for you to switch back to kde 3.X for a while?
> >
> >yes of course ;) I am happily using 3.5 at the moment.
> >
> >If you want to have some stuff or ideas tested or need some informat=
ion,
> > feel free to send me a mail.
>
> Eventually I have launched kde4 with the attached patch.
> The fixed problem is described in the patch header.
> Would you please try this?

I couldn't sleep anyway and since var was tarred up already ...

I did mkfs.reiser4 /dev/sda6 (the partition mounted as /var), applied y=
our=20
patch, built the kernel, restored var, rebooted, and logged into kde4.

No oops, no problem.

So the patch seems to work.

Thank you very much!

Gl=FCck Auf,
Volker
-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
