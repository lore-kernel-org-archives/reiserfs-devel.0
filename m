From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Sun, 13 Oct 2002 05:39:05 +0400
Message-ID: <3DA8CEB9.9050502@namesys.com>
References: <200210122302.g9CN23BD000383@sirius.cs.pdx.edu> <200210130127.32489.bofh@coker.com.au> <20021013020800.T14731@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11671-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: Russell Coker <bofh@coker.com.au>, The Amazing Dragon <ehem@cs.pdx.edu>, reiserfs-list@namesys.com

Ragnar Kj=F8rstad wrote:

>On Sun, Oct 13, 2002 at 01:27:32AM +0200, Russell Coker wrote:
> =20
>
>>>Then you've got to add network, gigabit ethernet is 250MBps (total, full
>>>duplex). There is ten gigabit coming in the near future which half duplex
>>>is 1250MBps, I guess you're going to need a second PCI-X bus just to
>>>handle /most/ of the network bandwidth.
>>>     =20
>>>
>>I still haven't heard of anyone getting more than 50% throughput out of 1=
Gb=20
>>Ethernet, I doubt that a PC will use any portion of 10Gb Ethernet at any =
time=20
>>in the near future.
>>   =20
>>
>
>We've messured over 70 MB/s throughput on our NAS-server (NFS).=20
>That is 70MB/s in data-transfer (bonnie++ numbers), so when you take
>NFS, UDP, IP and ethernet-overhead into account you get an even higher
>network throughput.
>
>I haven't tested raw ethernet-throughput, but I would assume that to be
>even higher.
>
>
> =20
>
Is that a bigstorage.com NAS?


