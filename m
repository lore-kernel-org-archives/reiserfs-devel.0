From: michael chang <thenewme91@gmail.com>
Subject: Re: Trouble with reiserfs.
Date: Fri, 30 Sep 2005 17:33:40 -0400
Message-ID: <b14e81f00509301433j64e1e88cgf7cc395cab99869@mail.gmail.com>
References: <f28212bb0509301357i58986a3em52525c99d8cfb53d@mail.gmail.com>
Reply-To: michael chang <thenewme91@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26366-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <f28212bb0509301357i58986a3em52525c99d8cfb53d@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonson Player <jonsonplayer@gmail.com>
Cc: vitaly@namesys.com, reiserfs-list@namesys.com

On 9/30/05, Jonson Player <jonsonplayer@gmail.com> wrote:
>  i just made an img copy with dd_rescue from a broken software raid syste=
m
> (mirror style). I obtained an img from one of hard drive and i wanted to
> check this img with reiserfs tool, but he told me the following message:

>  0%Not enough allocable blocks, checking bitmap...there are 0 allocable
> blocks, btw
>
>  out of disk space
>  Aborted

Are you checking from a read-write medium (HD) or are you checking an
image on e.g. a read-only medium such as a CD/DVD?  Also, is the image
bigger than the original partition, or exactly the same size, or
smaller (and same for FS size compared to image size).

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
