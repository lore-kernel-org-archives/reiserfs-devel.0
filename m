From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: Re: Which filesystem do errors come from?
Date: Fri, 26 Jul 2002 17:19:03 +0200 (CEST)
Message-ID: <Pine.LNX.4.44.0207261712500.9912-100000@grignard.amagerkollegiet.dk>
References: <20020726132410.B18706@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-list-return-11086-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020726132410.B18706@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

On Fri, 26 Jul 2002, Oleg Drokin wrote:

> > However, I cannot seem to find out, what filesystem, these errors come
> > from:
> > How can I see, whether the messages come from hda6 or hdc1?
>
> Unfortunatelly this is impiossible, except you know which files should be
> accessed to get this error.

I thought that perhaps some of the numbers could tell. But I found out
by copying a lot of files - the error showed up in a small squid cache
on hda6.

> We have some patches thatare supposed to print device name for each
> warning/error, but we cannot push anything into 2.4 until 2.4.19 is out a=
nyway.

No, of course not.

Thanks for the answer.

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
Life is that property, which a being will lose as a result of falling
out of a cold and mysterious cave 30 miles above ground level.
                     - HitchHikers Guide to the Galaxy, Douglas Adams
----------------------------------[ moffe at amagerkollegiet dot dk ] --


