From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH CFT] tons of logging patches + addon
Date: Tue, 09 Jul 2002 02:22:48 +0200
Message-ID: <3D2A2CD8.1080907@mb.tu-ilmenau.de>
References: <1023076301.22608.1778.camel@tiny>	<3CFC1CB5.8040102@mb.tu-ilmenau.de>	<1023	 	157228.31475.38.camel@tiny>	<3CFC33F2.7080009@mb.tu-ilmenau.de>	<1023196345	.		31682.81.camel@tiny>	<3CFE7EFB.6080203@mb.tu-ilmenau.de>	<3CFE8234.7010006@m	 b.tu-ilmenau.de>	<1023322167.2920.772.camel@tiny>	<3D07CBE7.5080701@mb.tu-ilmenau.de> <1024274859.11086.68.camel@tiny>	<3D0D2DEE.7080909@mb.tu-ilmenau.de>  <1024340679.18666.36.camel@tiny>	<1025272280.1685.6.camel@tiny>  <1025633764.5878.432.camel@tiny>	<1025729771.5878.598.camel@tiny>  <3D2396AF.8020508@mb.tu-ilmenau.de> <1026136293.5663.56.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10933-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 07/08/2002 03:51 PM, Chris Mason wrote:

[...]

Thanks a lot,for your comments, Chris!

>=20
> It is dangerous to use -13 at all, although the bug is pretty difficult=

> to trigger.  Please run reiserfsck --check before upgrading.
>=20
> -chris
>=20

O.k., so far "no problems" with -13 "data=3Dordered". I write your advice=
=20
to real paper and pin it over my desk to remember this advice after the=20
new patch appeared... :-))

***

So far I assume I had more errors from my cheap hardware than from=20
anything else (e.g. ReiserFS + any patch-combo) over the last 3..5..7?=20
months. :-(

Last weekend after beeing heavily bugged by my notebook (no obvious=20
errors any more) I decided to carefully disassemble it completely=20
(warranty exceeded by 2 months), clean it and reassemble it:

Oleg was really right at the end! It was an overheating problem of a=20
special kind: As my CPU lost its contact to its "little fixiating=20
plastic piece part to the socket" (don't know the exact term ;-) ) the=20
CPU was able to move some =B5m..mm in the socket. The CPU/fan - fan fixed=
=20
with 4 screws over the CPU- obviously lost their contact when the fan=20
went on working (torque) or the CPU/chipset decided to stop when the=20
temperature went too high inbetween. Whooo, I have new 512MB Infineon=20
notebook RAM through this case... Should I be quiet or report this to=20
the manufacturer and/or their local outlet in .de, now?

The notebook now works like I bought it: fine, stable and the thermal=20
(fan start/stop) patterns are quite well though I didn't replace the=20
thermal pads between CPU&fan and the heatsink-to-graphix-and-chipset as=20
always and everywhere recommended. (Oh, try to get these special parts=20
once!!!)
We had up to 35=B0C today here in Germany. That's a good restart!

***

Best regards,
I'm really sorry for the traffic and attention due to this circumstance! =

I was really encouraged by Olegs comments finally, thanks to you, Oleg!

Thanks to all,

Manuel

