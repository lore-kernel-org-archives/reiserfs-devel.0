From: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Subject: Re: Reiser4: errors AFTER fsck
Date: Sat, 5 Apr 2008 11:46:11 +0200
Message-ID: <200804051146.12025.volker.armin.hemmann@tu-clausthal.de>
References: <200804041938.18418.volker.armin.hemmann@tu-clausthal.de> <200804042254.56672.volker.armin.hemmann@tu-clausthal.de> <47F74890.3080005@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47F74890.3080005@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>

On Samstag, 5. April 2008, Edward Shishkin wrote:
> Volker Armin Hemmann wrote:
> >Hi,
> >
> >one essential thing I forgot:
> >
> >last night I switched off my computer a little bit too fast, at boot=
 I had
> >unclean fs. That could explain the initial corruption that portage
> > complained about.
>
> Normally this shouldn't lead to data corruption.
> So I would ask everyone to pack metadata _before_
> --build-fs, if the last one is required after hard reset.

yeah, the other two reiser4 partitions survived very well.  The prematu=
re=20
shutdown was just the only unusual thing that happend that I know of so=
 I=20
mentioned it. But maybe the corruption happened earlier and went unnoti=
ced=20
for a while. /var is used in bursts ... sometimes days without me activ=
ely=20
accessing it and when the loggers complain, it goes on pretty much unno=
ticed=20
for a while.

I hope the meta.gz is helpfull.

Gl=FCck Auf,
Volker=20
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
