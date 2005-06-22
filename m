From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: reiser4 plugins
Date: Thu, 23 Jun 2005 02:23:55 +0400
Message-ID: <17081.58619.671650.812286@gargle.gargle.HOWL>
References: <200506221733.j5MHXEoH007541@laptop11.inf.utfsm.cl>
	<42B9DD48.6060601@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24478-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42B9DD48.6060601@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, =?UTF-8?B?TWFya3VzIFTQlnJu?= =?UTF-8?B?cXZpc3Q=?= <mjt@nysv.org>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, hch@infradead.org, jgarzik@pobox.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

David Masover writes:

[...]

 > 
 > What we want is to have programs that can write small changes to one
 > file or to many files, lump all those changes into a transaction, and
 > have the transaction either succeed or fail.

No existing file system guarantees such behavior. Even atomicity of
single system call is not guaranteed.

 > 
 > > it doesn't stop the system dead in its tracks waiting for some very long
 > > transaction to finish?
 > 
 > We've also discussed this.  For one thing, if we can have transactions
 > in databases which don't stop the database dead in its tracks, why can't
 > we do it with filesystems?

Because to have such transactions databases pay huge price in both
resource consumption and available concurrency (isolation, commit-time
locks, etc.), and yet mechanism they use to deal with stuck transactions
(which is simply to abort it) is not very suitable for the file system.

 > 
 > But anyway, if you really want to know, ask someone else or read the
 > archives.  I wasn't really paying attention except to remember that this
 > issue was resolved.

That would be real breakthrough.

[...]

 > 
 > >>                                                 fibretions, etc,
 > > 
 > > 
 > > ???
 > 
 > Low-level tweaking.  I think the word is from some sort of calculus.

Fibration. http://marc.theaimsgroup.com/?l=linux-kernel&m=108032604606183&w=2

Nikita.
