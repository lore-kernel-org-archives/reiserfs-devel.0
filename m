From: "Serge Rodrigues" <serge@onpoi.net>
Subject: RE : RE : some troubles with mounting reiserfs
Date: Thu, 1 May 2003 19:55:22 +0200
Message-ID: <000101c3100a$d9356b60$0832a8c0@dell8100>
References: <20030429054044.GI1231@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13914-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030429054044.GI1231@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Oleg Drokin' <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hello,


-----Message d'origine-----
De=A0: Oleg Drokin [mailto:green@namesys.com]=20
Envoy=E9=A0: mardi 29 avril 2003 7:41
=C0=A0: Serge Rodrigues
Cc=A0: reiserfs-list@namesys.com
Objet=A0: Re: RE : some troubles with mounting reiserfs

Hello!

On Mon, Apr 28, 2003 at 09:33:20PM +0200, Serge Rodrigues wrote:

> ReiserFS version 3.6.25
> hdb: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
> hdb: dma_intr: error=3D0x40 { UncorrectableError }, =
LBAsect=3D142082111,
> sector=3D142082048
> end_request: I/O error, dev 03:41 (hdb), sector 142082048
> hdb: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
> hdb: dma_intr: error=3D0x40 { UncorrectableError }, =
LBAsect=3D147587135,
> sector=3D147587072
> end_request: I/O error, dev 03:41 (hdb), sector 147587072
> sh-2029: reiserfs read_bitmaps: bitmap block (#17760256) reading
failed
> reiserfs_read_super: unable to read bitmap

>>These are sure sign of something cannot be read from your disk.
>>Though I am not sure why badblocks outputs no info.
>>How about running badblocks without specifying start offset and device
size?


After a very very very long badblocks -n -s -b 4096 /dev/hdb1, it found
some badblocks. What I need to do for recover my HDD if any solution
exist ?



>>Bye,
>>    Oleg


Thx
Serge


