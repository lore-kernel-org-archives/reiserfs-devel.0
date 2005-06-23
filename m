From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Thu, 23 Jun 2005 08:12:29 -0700
Message-ID: <42BAD15D.5030808@namesys.com>
References: <200506221733.j5MHXEoH007541@laptop11.inf.utfsm.cl>	<42B9DD48.6060601@slaphack.com> <17081.58619.671650.812286@gargle.gargle.HOWL> <42BAC668.2030604@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24497-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BAC668.2030604@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Nikita Danilov <nikita@clusterfs.com>, "Artem B. Bityuckiy" <dedekind@yandex.ru>, =?UTF-8?B?TWFya3VzIFTQlnJucXZpc3Q=?= <mjt@nysv.org>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, hch@infradead.org, jgarzik@pobox.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

David Masover wrote:

> Nikita Danilov wrote:
>
> >David Masover writes:
>
> >[...]
>
> > >
> > > What we want is to have programs that can write small changes to one
> > > file or to many files, lump all those changes into a transaction, and
> > > have the transaction either succeed or fail.
>
> >No existing file system guarantees such behavior. Even atomicity of
> >single system call is not guaranteed.
>
>
> No _existing_ filesystem.  But I seem to recall that this was one of the
> design decisions of Reiser4, and that the system call itself was pushed
> off to 4.1?

Thats right.

>
> Maybe I'm just wrong about how big a transaction can be.

No, you are not.

Isolation is not easy for an fs, but fusing multiple atoms from multiple
file modifications into one "guaranteed to commit or fail all together"
atom is easy.
