From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: reiser4 for 2.6.13 is available on our website
Date: Fri, 30 Sep 2005 14:01:16 +0200
Message-ID: <op.sxwzoenad4os1z@localhost>
References: <433C23A2.9020403@namesys.com> <op.sxvmrokbd4os1z@localhost> <1128031794.10856.155.camel@gentoo> <200509301231.02169.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26358-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509301231.02169.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: Alexander Zarochentsev <zam@namesys.com>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Fri, 30 Sep 2005 10:31:01 +0200, Alexander Zarochentsev =20
<zam@namesys.com> napisa=B3:

> On Friday 30 September 2005 02:09, Jake Maciejewski wrote:
>> I get the same with 2.6.13.2 and gcc 3.4.4 on amd64
>>
> can you try this patch?
> -----------------------------------
> --- a/fs/reiser4/spin_macros.h
> +++ b/fs/reiser4/spin_macros.h
> @@ -82,8 +82,6 @@ typedef struct reiser4_rw_data {
>  static inline void spin_ ## NAME ## _init(TYPE *x)				\
>  {										\
>  	__ODCA("nikita-2987", x !=3D NULL);					\
> -	cassert(sizeof(x->FIELD) !=3D 0);						\
> -	memset(& x->FIELD, 0, sizeof x->FIELD);					\
>  	spin_lock_init(& x->FIELD.lock);					\
>  }										\
>  										\
> @@ -236,7 +234,6 @@ typedef struct { int foo; } NAME ## _spi
>  static inline void rw_ ## NAME ## _init(TYPE *x)				\
>  {										\
>  	__ODCA("nikita-2988", x !=3D NULL);					\
> -	memset(& x->FIELD, 0, sizeof x->FIELD);					\
>  	rwlock_init(& x->FIELD.lock);						\
>  }										\
>  										\
> -----------------------------------

It helped (cut and paste didn't worked for me as the resulting patch =20
didn't applied but I just deleted those 3 lines by hand). Kernel did =20
compile and now I'm writing this running 2.6.13 with reiser4 as /. I hope  =

I won't see any oopses during shutdown as I sow with 2.6.13-mm{1,2} based  =

kernels (archck).

