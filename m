From: wolfgang.glas@ev-i.at
Subject: Re: Howto reformat root partition
Date: Tue, 9 Apr 2002 11:04:42 +0200
Message-ID: <OF64BE5856.EE2EDA07-ONC1256B96.0031B944@ev-i.at>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 0031DE7AC1256B96_="
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=_alternative 0031DE7AC1256B96_=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Timothy,


   I tried to add the conv option to /etc/fstab for my reiserfs root=20
partition and did lose. I had to boot from CD, mount my root partition,=20
reformat it using v3.6 disk format, copy the old content back, reboot the=20
new root partition from CD and re-run lilo.

  The reason is that the root partition is mounted read-only during system =

startup and later on re-mounted R/W using the entry in /etc/fstab.

  As for my part, I could not establish to do the initial mount with -o=20
conv. Anyways, I don't see any reason, why this should be necessary.

  Regards,

   Wolfgang

--
Dr. Wolfgang Glas                        EV-i Informationstechnologie=20
GmbH.
Gesch=E4ftsf=FChrer                          Sebastian-Kneipp-Weg 17
Wolfgang.Glas@ev-i.at                    A-6020 Innsbruck/Austria
phone: ++43-512-284883-2                 fax: ++43-512-281624-31

--=_alternative 0031DE7AC1256B96_=
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


<br><font size=3D2 face=3D"sans-serif">Dear Timothy,</font>
<br>
<br>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp;I tried to add the conv=
 option to /etc/fstab for my reiserfs root partition and did lose. I had to=
 boot from CD, mount my root partition, reformat it using v3.6 disk format,=
 copy the old content back, reboot the new root partition from CD and re-ru=
n lilo.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">&nbsp; The reason is that the root p=
artition is mounted read-only during system startup and later on re-mounted=
 R/W using the entry in /etc/fstab.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">&nbsp; As for my part, I could not e=
stablish to do the initial mount with -o conv. Anyways, I don't see any rea=
son, why this should be necessary.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">&nbsp; Regards,</font>
<br>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp;Wolfgang</font>
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
--=_alternative 0031DE7AC1256B96_=--
