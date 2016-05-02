From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Alpha Reiser4 (SFRN 4.0.1) -enabled Debian netboot image
Date: Mon, 2 May 2016 05:05:21 -0700
Message-ID: <CAM12Q5SkATOyYTDSs5vPg75dWefwHAKAsYXRBuB8t9X2kSZQkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=94eb2c0458ae901f590531daced1
Return-path: <bounce-debian-boot=debian-boot=m.gmane.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:date:message-id:subject:from:to:cc;
        bh=FdKocB0/yRWuGvWvh4AQsdFCS65Cego79bqHc+iz0zs=;
        b=GqudgUbXBkZb33PDQSkfXBUaXqR7JMmT74dTzSpeomfVjtRKyff/6epGn/NYYWPoOM
         SwHoDwzXL+eyFLnDIJ3Tgtg7vc3d5G796fw6BS/dB4MAp7NTyiDSslF6qppBhbH47Mj6
         XKbSGyxRUiM0vCMS87jioJ3WS2NO90sy4eYtIQWYYParziVI8ko5Bga1tSewzJ2UnFcG
         OFYf1GaXp1LY8C6jda2KrWyPo5nxy5ZYRMX1/NIFmSfxD9/SeAHXI2OTcxlhRUK2XRYa
         jSbin/Crj5PrTbEgmsD48nRxg/ZjoWGzhC0rOFzK9pjMRYkguxqOKtMwWdm4ubMDJib3
         QBmg==
Sender: jose.r.r@metztli.com
Resent-Message-ID: <B2nOjuflNHG.A.S9D.VK0JXB@bendel>
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-boot/>
List-Post: <mailto:debian-boot@lists.debian.org>
List-Help: <mailto:debian-boot-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-boot-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-boot-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAM12Q5SkATOyYTDSs5vPg75dWefwHAKAsYXRBuB8t9X2kSZQkQ@mail.gmail.com
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: debian-boot@lists.debian.org

--94eb2c0458ae901f590531daced1
Content-Type: text/plain; charset=UTF-8

Niltze all-

Realizing that change frequency in Debian software components for
Reiser4-enabled Debian (sid) Unstable image renders media stale quite soon,
I created a Jessie netboot image.

Existing instructions should work as a guide,
http://marc.info/?l=reiserfs-devel&m=145824683620735&w=2

and previous links should work, too, i.e.,
metztli.iso --> linux-jessie-reiser4-amd64.deb
metztli.SHA256 --> linux-jessie-reiser4-amd64.SHA256SUM

I suggest installation in expert mode so as to select the Reiser4
(SFRN)-enabled kernel when relevant dialog appears. Menu is a link that
will download Debian kernel 4.5.x -- built under Jessie with a custom built
GCC-5.

If interested in a graphical guide to install Debian Jessie with netboot
ISO/USB media, please see snapshots:

https://metztli.it/blog/index.php/ixiptli/aH4
and then
https://metztli.it/blog/index.php/ixiptli/aH3


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------

--94eb2c0458ae901f590531daced1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Niltze all-<div><br></div><div>Realizing that change frequ=
ency in Debian software components for Reiser4-enabled Debian (sid) Unstabl=
e image renders media stale quite soon, I created a Jessie netboot image.</=
div><div><br></div><div>Existing instructions should work as a guide,</div>=
<div><a href=3D"http://marc.info/?l=3Dreiserfs-devel&amp;m=3D14582468362073=
5&amp;w=3D2">http://marc.info/?l=3Dreiserfs-devel&amp;m=3D145824683620735&a=
mp;w=3D2</a><br></div><div><br></div><div>and previous links should work, t=
oo, i.e.,</div><div>metztli.iso --&gt; linux-jessie-reiser4-amd64.deb</div>=
<div>metztli.SHA256 --&gt; linux-jessie-reiser4-amd64.SHA256SUM<br></div><d=
iv><br></div><div>I suggest installation in expert mode so as to select the=
 Reiser4 (SFRN)-enabled kernel when relevant dialog appears. Menu is a link=
 that will download Debian kernel 4.5.x -- built under Jessie with a custom=
 built GCC-5.</div><div><br></div><div>If interested in a graphical guide t=
o install Debian Jessie with netboot ISO/USB media, please see snapshots:</=
div><div><br></div><div><a href=3D"https://metztli.it/blog/index.php/ixiptl=
i/aH4">https://metztli.it/blog/index.php/ixiptli/aH4</a><br></div><div>and =
then</div><div><a href=3D"https://metztli.it/blog/index.php/ixiptli/aH3">ht=
tps://metztli.it/blog/index.php/ixiptli/aH3</a><br></div><div><br></div><di=
v><br></div><div>Best Professional Regards.</div><div><br></div><div>-- <br=
><div class=3D"gmail_signature">Jose R R<br><a href=3D"http://metztli.it" t=
arget=3D"_blank">http://metztli.it</a><br>---------------------------------=
------------------------------------------------------------<br>Try at no c=
harge <a href=3D"http://b2evolution.net" target=3D"_blank">http://b2evoluti=
on.net</a> for <a href=3D"http://OpenShift.com" target=3D"_blank">http://Op=
enShift.com</a> PaaS<br>---------------------------------------------------=
------------------------------------------<br>from our GitHub <a href=3D"ht=
tp://Nepohualtzintzin.com" target=3D"_blank">http://Nepohualtzintzin.com</a=
> repository. Cloud the easy way!<br>--------------------------------------=
-------------------------------------------------------</div>
</div></div>

--94eb2c0458ae901f590531daced1--

