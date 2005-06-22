From: Andrew Morton <akpm@osdl.org>
Subject: Re: reiser4 plugins
Date: Tue, 21 Jun 2005 18:18:02 -0700
Message-ID: <20050621181802.11a792cc.akpm@osdl.org>
References: <20050620235458.5b437274.akpm@osdl.org>
	<42B831B4.9020603@pobox.com>
	<42B87318.80607@namesys.com>
	<20050621202448.GB30182@infradead.org>
	<42B8B9EE.7020002@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24435-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42B8B9EE.7020002@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: hch@infradead.org, jgarzik@pobox.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> wrote:
>
> What is wrong with having an encryption plugin implemented in this
>  manner?  What is wrong with being able to have some files implemented
>  using a compression plugin, and others in the same filesystem not.
> 
>  What is wrong with having one file in the FS use a write only plugin, in
>  which the encrypion key is changed with every append in a forward but
>  not backward computable manner, and in order to read a file you must
>  either have a key that is stored on another computer or be reading what
>  was written after the moment of cracking root?
> 
>  What is wrong with having a set of critical data files use a CRC
>  checking file plugin?

I think the concern here is that this is implemented at the wrong level.

In Linux, a filesystem is some dumb thing which implements
address_space_operations, filesystem_operations, etc.

Advanced features such as those which you describe are implemented on top
of the filesystem, not within it.  reiser4 turns it all upside down.

Now, some of the features which you envision are not amenable to
above-the-fs implementations.  But some will be, and that's where we should
implement those.

