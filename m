From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: filesystem corruption howto ???
Date: Fri, 11 Apr 2003 14:09:16 +0400
Message-ID: <200304111409.16424.vitaly@namesys.com>
References: <KNEEIPAKDPLGFNIPLECJEELNHDAA.v.ndiowona@aramiska.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13642-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <KNEEIPAKDPLGFNIPLECJEELNHDAA.v.ndiowona@aramiska.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ndiowona <v.ndiowona@aramiska.net>
Cc: reiserfs-list@namesys.com

Hi,

On Friday 11 April 2003 10:05, ndiowona wrote:
> Hi,
> I'm running RH linux  2.2.20 with reiserfs.I have some trouble with the=
 wn
> web server.
> The system reports me the following message:
>
> wnsd: can't create temp directory /tmp/wn_tmp99.
> When I " cd /tmp",running "ls -ltr" reports me the following:
> ls: wn_temp99: Input/Output error
> ls: ftpcopy2.log: Input/Output error
> -rw-r--r-- 1 root root 246 apr 10:02 ftpcopy1.log

This probably means bad blocks on the partition. Do you see anything=20
related in the syslog?=20

--=20
Thanks,
Vitaly Fertman
