From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Thu, 10 Oct 2002 21:31:29 +0400
Message-ID: <3DA5B971.3040400@namesys.com>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain>	<001b01c26fff$26d23850$0101a8c0@bummer> <20021010165854.4381ed7e.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11645-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: =?ISO-8859-1?Q?Philippe_Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: darren <teodarren@myrealbox.com>, reiserfs-list@namesys.com

Philippe Gramoull=E9 wrote:

>Hi,
>
>On Thu, 10 Oct 2002 09:48:34 +0800
>"darren" <teodarren@myrealbox.com> wrote:
>
>  |  Hi all,
>  | =20
>  |  I was just wondering if I should spend $$ (my company's of cos) on a
>  |  NetApp filer...
>  | =20
>  |  OR
>  | =20
>  |  I just get one of the Dell 3650 doing nothing in the corner with RAID5
>  |  and run Samba as a fileserver?
>  | =20
>  |  Anyone got any benchmarks to compare the two?
>  | =20
>  |  Is NetApp as good as its advertised?
>
>We switched from NetApp to DELL ( PowerVault 210S ) mainly because of the =
$$ :o)
>
>NetApp are really good but really expensive as well.So it depend how much =
value
>you give to your data.
>
I would say that WAFL is an absolutely superb filesystem for the purpose=20
of RAID NFS fileserving.  Reiser4 may give it some serious competition=20
after some time has passed and we have time for such things as carefully=20
benchmarking NFS, etc., but WAFL is a great filesystem for NFS RAID as=20
it is right now.  That said, mp3.com saved $22 million dollars by using=20
Linux+reiserfs instead of Netapps and Veritas.  They may be good, but=20
reiser3 is cheaper.  A lot cheaper.  Do the math, and you'll buy Linux=20
instead I think.;-)

Nobody has done reiser3 vs. WAFL benchmarks.

>
>Netapp as well have tons of features that  linux boxes +PV210S can't do :C=
lustering
>volume copy, out out the box snapshots,etc..
>
Linux has snapshots if you use lvm, but it is true that  Netapp makes a=20
good product.

>
>  | =20
>  |  Any comments on this setup is welcomed
>
>Now i think DELL realease their 220S with 14 disks in a shelf so that woul=
d have the bang
>for your bucks. On the otherside, NetApp comes with a very nice , propriet=
ary , OS that's quite
>simple to use.
>
>So best price/performance =3D> DELL
>If you have unvaluable data =3D> NetApp (+ backup :o)
>
>  | =20
>  |  Regards
>  |  Darren
>  | =20
>
>
>Philippe.
>
>
> =20
>



