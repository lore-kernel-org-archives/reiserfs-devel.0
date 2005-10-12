From: =?UTF-8?B?RnJpZWRlciBCw7xyemVsZQ==?= <linux-stuff@arcor.de>
Subject: Re: 2.6.13.2 + reiser4 system hangs and poor performance
Date: Wed, 12 Oct 2005 15:02:13 +0200
Message-ID: <434D0955.3020509@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26506-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com

same for me

X locks but I still can login per ssh
the process ent.sda5! uses almost the whole cpu
/ is /dev/sda5

I=C2=B4m using kernel 2.6.14-rc4 and reiser4patches from 2.6.14-rc2-mm2 +=20
reiser4-add-put_inode.patch

so long

Frieder



jp wrote:

>Hi,
>
>I can confirm this problem :
>
>Process or System hang during depmod -> need hard shutdown to get out.
>
>Tested on 2.6.13, 2.6.13.2 , 2.6.13.3.
>
>No problem with 2.6.13mm3.
>
>How to reproduce it : Install the latest Nvidia driver.
>
>No logs.
>
>Best regards
>
>JP
> =20
>
