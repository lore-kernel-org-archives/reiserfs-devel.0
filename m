From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: reiser4 resize
Date: Thu, 21 Sep 2006 09:49:08 +0200
Message-ID: <op.tf7xb6zzd4os1z@localhost>
References: <eeng4b$i68$1@sea.gmane.org> <200609191723.01936.vs@namesys.com> <45102ED6.6080209@slaphack.com> <b5d90b2a0609200039g70c40f5bvb374b5f15b42988d@mail.gmail.com> <op.tf52pansd4os1z@localhost> <b5d90b2a0609200200s5838456bm618093395356390a@mail.gmail.com> <45123F81.4040909@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45123F81.4040909@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: David Masover <ninja@slaphack.com>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Thu, 21 Sep 2006 09:30:09 +0200, David Masover <ninja@slaphack.com> =20
napisa=B3:

> --- linux/fs/buffer.c   2006-08-15 20:40:36.504608696 -0500
> +++ linux/fs/buffer.c.new       2006-08-15 20:42:35.877461264 -0500
> @@ -366,12 +366,12 @@
>
>   asmlinkage long sys_fsync(unsigned int fd)
>   {
> -       return __do_fsync(fd, 0);
> +       return 0;
>   }
>
>   asmlinkage long sys_fdatasync(unsigned int fd)
>   {
> -       return __do_fsync(fd, 1);
> +       return 0;
>   }
>
>   /*

I remember that I played a little with disabling sync in reiser4 sources,  =

it helped only for amarok (it's uses sqlite for storing statistic data and =
=20
it writes to it on song change, sqlite calls sync and it ends up with =20
writeing to disk instead of playing a song, at least on my fs), =20
bittorrents clients were generating as lot of disk as previously so I gues =
=20
it's more likely coused by data/tree fragmentation.
Just my 0,6374526$ ;)
