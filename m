From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 02:18:49 +0200 (CEST)
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0408260204050.22259@artax.karlin.mff.cuni.cz>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
 <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>



On Wed, 25 Aug 2004, Linus Torvalds wrote:

> On Wed, 25 Aug 2004, Christoph Hellwig wrote:
> >
> > For one thing _I_ didn't decide about xattrs anyway.  And I still
> > haven't seen a design from you on -fsdevel how you try to solve the
> > problems with files as directories.
>
> Hey, files-as-directories are one of my pet things, so I have to side with
> Hans on this one. I think it just makes sense. A hell of a lot more sense
> than xattrs, anyway, since it allows scripts etc standard tools to touch
> the attributes.
>
> It's the UNIX way.
>
> And yes, the semantics can _easily_ be solved in very unixy ways.
>
> One way to solve it is to just realize that a final slash at the end
> implies pretty strongly that you want to treat it as a directory. So what
> you do is:
>
>  - without the slash, a file-as-dir won't open with O_DIRECTORY (ENOTDIR)
>  - with the slash, it won't open _without_ O_DIRECTORY (EISDIR)
>
> Problem solved. Very user-friendly, and very intuitive.

Stupid question: who will use it? And why?

Anyone can write an userspace library, that implements function
set_attribute(char *file, char *attribute, char *value), that creates
directory ".attr/file" in file's directory and stores attribute there.
(and you can get list of attributes from shell too:
ls `echo "$filename" |sed 's/\/\([^\/]*\)$/\/\.attr\/\1/'`
). There's no need to add extra functionality to kernel and filesystem.

Advantage:
- you don't add bloat to kernel or filesystem
- you don't need to teach tar/cp -a/mc about attributes
- you won't lose attributes after editing file in vim (it creates another
file and renames it over original one)

> Will it potentially break something? Sure. Do we care? Me, I'll take that
> kind of extension _any_ day over xattrs, that are fundamentally flawed in
> my opinion and totally useless. The argument that applications like "tar"
> won't understand the file-as-directory thing is _flawed_, since legacy
> apps won't understand xattrs either.

The only way xattrs are useful is that backup/restore software doesn't
have to know about every filesystem with it's specific attributes and
every magic ioctl for setting them. Instead it can save/restore
filesystem-specific attributes without understanding what do they mean.
However there's no need why application should use them. And no
application does.

I can't imagine anyone shipping an application with "this app requires
reiser4" prerequisite. Why should anyone use it if he can store attributes
in ".attr" directory or whereever and make the application work on any OS
and any filesystem?

Mikulas
