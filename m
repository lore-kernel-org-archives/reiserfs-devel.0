From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 plugins
Date: Sat, 25 Jun 2005 22:55:28 +0400
Message-ID: <200506252255.29208.zam@namesys.com>
References: <20050620235458.5b437274.akpm@osdl.org> <42B8B9EE.7020002@namesys.com> <20050621181802.11a792cc.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24591-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050621181802.11a792cc.akpm@osdl.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, linux-kernel@vger.kernel.org

On Wednesday 22 June 2005 05:18, Andrew Morton wrote:
> Hans Reiser <reiser@namesys.com> wrote:
> > What is wrong with having an encryption plugin implemented in this
> >  manner?  What is wrong with being able to have some files implemented
> >  using a compression plugin, and others in the same filesystem not.
> >
> >  What is wrong with having one file in the FS use a write only plugin, in
> >  which the encrypion key is changed with every append in a forward but
> >  not backward computable manner, and in order to read a file you must
> >  either have a key that is stored on another computer or be reading what
> >  was written after the moment of cracking root?
> >
> >  What is wrong with having a set of critical data files use a CRC
> >  checking file plugin?
>
> I think the concern here is that this is implemented at the wrong level.

> In Linux, a filesystem is some dumb thing which implements
> address_space_operations, filesystem_operations, etc.
>

It is not so already.  XFS, FUSE, network fs are not of that type.

Thanks,
Alex.

