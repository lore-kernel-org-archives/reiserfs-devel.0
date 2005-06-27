From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: -mm -> 2.6.13 merge status
Date: Mon, 27 Jun 2005 10:19:23 +0200
Message-ID: <20050627081923.GA9167@wohnheim.fh-wedel.de>
References: <20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com> <84144f0205062223226d560e41@mail.gmail.com> <42BB0151.3030904@suse.de> <20050623114318.5ae13514.akpm@osdl.org> <20050623193247.GC6814@suse.de> <1119717967.9392.2.camel@localhost> <20050627072449.GF19550@suse.de> <20050627072832.GA14251@wotan.suse.de> <Pine.LNX.4.58.0506271048310.26869@sbz-30.cs.Helsinki.FI>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24679-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0506271048310.26869@sbz-30.cs.Helsinki.FI>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pekka J Enberg <penberg@cs.Helsinki.FI>
Cc: Andi Kleen <ak@suse.de>, Jens Axboe <axboe@suse.de>, Andrew Morton <akpm@osdl.org>, Jeff Mahoney <jeffm@suse.de>, penberg@gmail.com, reiser@namesys.com, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Mon, 27 June 2005 10:49:19 +0300, Pekka J Enberg wrote:
> =20
>  #ifndef HAVE_ARCH_BUG_ON
> -#define BUG_ON(condition) do { if (unlikely((condition)!=3D0)) BUG(); } =
while(0)
> +#define BUG_ON(condition) do { \
> +	if (unlikely((condition) !=3D 0)) { \
> +		printk("kernel BUG '%s' at %s:%d!\n", #condition, __FILE__, __LINE__);=
 \
> +		panic("BUG!"); \
> +	} \
> +} while(0)
>  #endif

o How about those architectures, where BUG() and panic() are not the
  same thing?
o Embedded people might prefer not to have the additional string
  constants in the kernel.  Some config option would ease their wrath.
  And no, not all embedded people #define BUG() to nothing.

J=F6rn

--=20
Happiness isn't having what you want, it's wanting what you have.
-- unknown
