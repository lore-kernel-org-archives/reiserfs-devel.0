From: wolfgang.glas@ev-i.at
Subject: Re: knfsd/samba performance with reisefs and 1Gbit network.
Date: Mon, 8 Apr 2002 20:43:09 +0200
Message-ID: <OF3FB2BD32.CE13A9A8-ONC1256B95.00658DB4@ev-i.at>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 0066D427C1256B95_="
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

--=_alternative 0066D427C1256B95_=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

   I'm coming back to a thread, that we've had a couple of day ago and=20
like to inform you about our recent diagnostics regarding network stalls=20
with knfsd/samba using a Netgear Ga621 1GBit/s adapter. (driver: ns83820)

  We sticked to kernel-2.4.16 from SuSE and today I gave a stock 2.4.18=20
kernel (patched for LVM-1.0.3) a try and I have good and bad news for the=20
reiser-people:

bad news:  The network stalls copying a 1.5 GB file to the server occur=20
using even with 2.4.18 (reiserfs)
good news (?): The network stalls occur also with ext3 using this=20
kernel....

The SuSE-2.4.16 works fine together with ext3 and both network card=20
drivers: ns83820 contained in the kernel and netgear's own driver (gam.o), =

which I compiled on my own.

As reported earlier SuSE-2.4.16 does not work together with reiserfs. (1s=20
network stalls every 10 seconds....)

ns83820.c has the same version in 2.4.16-SuSE and 2.4.18
Netgear's driver (gam.o) does not work with 2.4.18

Weird thing, isn't it ?

   Regards.=20

     Wolfgang

--
Dr. Wolfgang Glas                        EV-i Informationstechnologie=20
GmbH.
Gesch=E4ftsf=FChrer                          Sebastian-Kneipp-Weg 17
Wolfgang.Glas@ev-i.at                    A-6020 Innsbruck/Austria
phone: ++43-512-284883-2                 fax: ++43-512-281624-31

--=_alternative 0066D427C1256B95_=
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


<br><font size=3D2 face=3D"sans-serif">Hi all,</font>
<br>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp;I'm coming back to a th=
read, that we've had a couple of day ago and like to inform you about our r=
ecent diagnostics regarding network stalls with knfsd/samba using a Netgear=
 Ga621 1GBit/s adapter. (driver: ns83820)</font>
<br>
<br><font size=3D2 face=3D"sans-serif">&nbsp; We sticked to kernel-2.4.16 f=
rom SuSE and today I gave a stock 2.4.18 kernel (patched for LVM-1.0.3) a t=
ry and I have good and bad news for the reiser-people:</font>
<br>
<br><font size=3D2 face=3D"sans-serif">bad news: &nbsp;The network stalls c=
opying a 1.5 GB file to the server occur using even with 2.4.18 (reiserfs)<=
/font>
<br><font size=3D2 face=3D"sans-serif">good news (?): The network stalls oc=
cur also with ext3 using this kernel....</font>
<br>
<br><font size=3D2 face=3D"sans-serif">The SuSE-2.4.16 works fine together =
with ext3 and both network card drivers: ns83820 contained in the kernel an=
d netgear's own driver (gam.o), which I compiled on my own.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">As reported earlier SuSE-2.4.16 does=
 not work together with reiserfs. (1s network stalls every 10 seconds....)<=
/font>
<br>
<br><font size=3D2 face=3D"sans-serif">ns83820.c has the same version in 2.=
4.16-SuSE and 2.4.18</font>
<br><font size=3D2 face=3D"sans-serif">Netgear's driver (gam.o) does not wo=
rk with 2.4.18</font>
<br>
<br><font size=3D2 face=3D"sans-serif">Weird thing, isn't it ?</font>
<br>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp;Regards. </font>
<br>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp;Wolfgang</font>
<br>
<br><font size=3D2 face=3D"sans-serif">--<br>
Dr. Wolfgang Glas &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;EV-i Informationstechnologie GmbH.<br>
Gesch=E4ftsf=FChrer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Sebastian-Kneipp-Weg 17<br>
Wolfgang.Glas@ev-i.at &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;A-6020 Innsbruck/Austria<br>
phone: ++43-512-284883-2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; fax: ++43-512-281624-31<br>
</font>
--=_alternative 0066D427C1256B95_=--
