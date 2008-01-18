From: Mat <jackdachef@gmail.com>
Subject: Re: bug report: reiser4 + kde4
Date: Fri, 18 Jan 2008 18:41:19 +0000 (UTC)
Message-ID: <loom.20080118T183841-90@post.gmane.org>
References: <20071122101615.178410@gmx.net> <200712152015.32737.volker.armin.hemmann@tu-clausthal.de> <4765D982.9010603@gmail.com> <200801172200.22182.volker.armin.hemmann@tu-clausthal.de> <4790B6DC.8070308@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org

>=20
> Not yet.
> Is it possible for you to switch back to kde 3.X for a while?
>=20
> >Because I just installed kde 4.0 and hit it.
> >
> >Gl=C3=BCck Auf
> >Volker
> >-

Just encountered the same behavior:
 PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND

4298 user  20   0  220m  13m  10m R   99  0.3  59:37.59 dolphin        =
       =20
                                                                       =
         =20
4811 user  20   0  151m  14m  12m R   98  0.4  14:51.42 okular  =20


this problem is a pretty cpu-eater :D

load currently is at 2.85=20

those apps used to work fine with reiserfs3.6

I hope you're able to reproduce it (pretty simple: just execute kde4-ap=
ps or the
kde4-desktop)

-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
