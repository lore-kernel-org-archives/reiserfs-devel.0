From: Adrian Phillips <a.phillips@met.no>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: 11 Oct 2002 14:34:40 +0200
Sender: "Adrian Phillips,,," <a.phillips@met.no>
Message-ID: <87lm556tnj.fsf@freeze.oslo.dnmi.no>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain>
	<001b01c26fff$26d23850$0101a8c0@bummer>
	<20021010165854.4381ed7e.philippe.gramoulle@mmania.com>
	<3DA5B971.3040400@namesys.com>
	<20021010195338.138dffcf.philippe.gramoulle@mmania.com>
	<20021011104041.GC29452@marowsky-bree.de>
	<20021011125412.2fe02af7.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11653-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021011125412.2fe02af7.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?iso-8859-1?q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

>>>>> "Philippe" =3D=3D Philippe Gramoull=E9 <philippe.gramoulle@mmania.com=
> writes:

    Philippe> And i only wanted to say that LVM (though part of all
    Philippe> modern distributions) doesn't come installed out of the
    Philippe> box,at least not on Debain , which we use mainly.

Does not one of the numerous 2.4 Debian kernel-images support LVM (I
always build my own) ? Certainly theLVM v1 tools are part of the
distribution. Or do you have another meaning for out of the box ?

    Philippe>   | It is very mature in my experience.

It has been for me. I've been using LVM and reiserfs together using
2.2 for 18 months now with almost no problems (a couple of buglets in
reiserfs which caused little in the way of problems), and more
recently 2.4 (although the 2.4.19 is causing some grief on what seems
to be memory management).

    Lars>   | With 2.4, go with LVM1. The jury is still out
    Lars> whether the successor will be | EVMS or LVM2 in 2.5/2.6,
    Lars> but I personally have decided to quite like EVMS.

Yes, I've been testing EVMS at home (although a bit behind with the
latest) and am impressed stability wise. I haven't looked at LVM2 yet
though.

Sincerely,

Adrian Phillips

--=20
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]

