From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 13:22:55 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
 <20040825200859.GA16345@lst.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20510-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040825200859.GA16345@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>



On Wed, 25 Aug 2004, Christoph Hellwig wrote:
> 
> For one thing _I_ didn't decide about xattrs anyway.  And I still
> haven't seen a design from you on -fsdevel how you try to solve the
> problems with files as directories.

Hey, files-as-directories are one of my pet things, so I have to side with 
Hans on this one. I think it just makes sense. A hell of a lot more sense 
than xattrs, anyway, since it allows scripts etc standard tools to touch 
the attributes.

It's the UNIX way.

And yes, the semantics can _easily_ be solved in very unixy ways.

One way to solve it is to just realize that a final slash at the end 
implies pretty strongly that you want to treat it as a directory. So what 
you do is:

 - without the slash, a file-as-dir won't open with O_DIRECTORY (ENOTDIR)
 - with the slash, it won't open _without_ O_DIRECTORY (EISDIR)

Problem solved. Very user-friendly, and very intuitive.

Will it potentially break something? Sure. Do we care? Me, I'll take that 
kind of extension _any_ day over xattrs, that are fundamentally flawed in 
my opinion and totally useless. The argument that applications like "tar" 
won't understand the file-as-directory thing is _flawed_, since legacy 
apps won't understand xattrs either.

Oh, add a O_NOXATTRS flag to force a path lookup to only use regular
directories, the same way we have O_NOFOLLOW and friends. That allows
people to see the difference, if they care (ie a file server might decide
that it doesn't want to expose things like this).

I never liked the xattr stuff. It makes little sense, and is totally 
useless for 99.9999% of everything. I still don't see the point of it, 
except for samba. Ugly.

		Linus
