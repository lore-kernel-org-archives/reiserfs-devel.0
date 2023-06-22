From: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 01/79] fs: add ctime accessors infrastructure
Date: Thu, 22 Jun 2023 06:14:30 -0400
Message-ID: <ad4bfb630128709588164db6f1fd2ef39c31d2a5.camel__23726.9920807861$1687428909$gmane$org@kernel.org>
References: <20230621144507.55591-1-jlayton@kernel.org>
         <20230621144507.55591-2-jlayton@kernel.org>
         <99b3c749-23d9-6f09-fb75-6a84f3d1b066@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687428888;
        bh=7+cabg86v1cYpPv8vDJOW5RfunjhlSEWXfJLwIkmtqs=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=bash4qEoN8ysoF4HTnLUBoIb4R/VvEf+WW/D9VIwZ7IkIbfsRZHAuo5DrHgU3mESQ
         YV3L6vJlJ5RLoTi5/71VkN5rQAydrP7yy38zcSGGfwasNdQxjqfQEDJO2KhRfaS72P
         L3pOkZCMNStmacczTh8Bxts4KstAt3iUVQoAzfNq5O0qEkTp/AQ/ZxnvFiOtuM8Rrh
         hGFigQvIDdzAyY8j4H2gTF58blmQ8XCJxFBrtJ8bp21DHjiO/HINP7f4QOOgCaaZnm
         wPOh/3PFD9MITyv48Pm3mcErp57QuFgfhsUJhmJROqlUtadgwIZDzlw31/avwVXFpE
         VwFt0TPP5toFA==
In-Reply-To: <99b3c749-23d9-6f09-fb75-6a84f3d1b066@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Damien Le Moal <dlemoal@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>

On Thu, 2023-06-22 at 09:46 +0900, Damien Le Moal wrote:
> On 6/21/23 23:45, Jeff Layton wrote:
> > struct timespec64 has unused bits in the tv_nsec field that can be used
> > for other purposes. In future patches, we're going to change how the
> > inode->i_ctime is accessed in certain inodes in order to make use of
> > them. In order to do that safely though, we'll need to eradicate raw
> > accesses of the inode->i_ctime field from the kernel.
> >=20
> > Add new accessor functions for the ctime that we can use to replace the=
m.
> >=20
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
>=20
> [...]
>=20
> > +/**
> > + * inode_ctime_peek - fetch the current ctime from the inode
> > + * @inode: inode from which to fetch ctime
> > + *
> > + * Grab the current ctime from the inode and return it.
> > + */
> > +static inline struct timespec64 inode_ctime_peek(const struct inode *i=
node)
>=20
> To be consistent with inode_ctime_set(), why not call this one inode_ctim=
e_get()

In later patches fetching the ctime for presentation may have side
effects on certain filesystems. Using "peek" here is a hint that we want
to avoid those side effects in these calls.

> ? Also, inode_set_ctime() & inode_get_ctime() may be a little more natura=
l. But
> no strong opinion about that though.
>=20

I like the consistency of the inode_ctime_* prefix. It makes it simpler
to find these calls when grepping, etc.

That said, my opinions on naming are pretty loosely-held, so if the
consensus is that the names should as you suggest, I'll go along with
it.
--=20
Jeff Layton <jlayton@kernel.org>
