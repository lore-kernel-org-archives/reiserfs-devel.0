From: "Ivan Pulleyn" <ivan.pulleyn@gmail.com>
Subject: Re: Possible bug with FIBMAP
Date: Sun, 27 Aug 2006 12:35:25 -0700
Message-ID: <755b32b20608271235s5878fba3pf01b4250cd07f2a9@mail.gmail.com>
References: <200608271057.12684.un_brice@vleu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29701-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608271057.12684.un_brice@vleu.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brice Arnould <un_brice@vleu.net>
Cc: reiserfs-list@namesys.com

-22 is EINVAL, or an invalid argument. Your file descriptor is
invalid, as proved by the assert().

Ivan...

On 8/27/06, Brice Arnould <un_brice@vleu.net> wrote:
> Hi
>
> Two users of a hack I wrote told me that
> http://vleu.net/shake/fb_r4.c (also attached with the mail)
> returned "FIBMAP=-22, FIGETBSZ=4096"
> on some of their files on reiser4 filesystems.
>
> Does this value of "-22" have a special meaning (would be strange), or is it a
> bug in Reiser4 ?
> I can ask them for more details, if you want.
>
> Thanks
> Brice
>
>
>
