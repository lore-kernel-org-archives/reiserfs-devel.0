From: Edward Shishkin <edward@namesys.com>
Subject: Re: how do plugins work?
Date: Sat, 26 Oct 2002 18:30:51 +0400
Sender: edward
Message-ID: <3DBAA71B.667E2EE8@namesys.com>
References: <Pine.LNX.4.33.0210241624300.2792-100000@mitte.informatik.hu-berlin.de> <3DB81095.25F0C662@namesys.com> <3DB8816C.10400@namesys.com> <3DB950B8.611CC982@namesys.com> <3DB9DE71.7000503@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11800-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: gregor@zeitlinger.de, reiserfs mailing list <reiserfs-list@namesys.com>

Hans Reiser wrote:
> 
> Edward Shishkin wrote:
> 
> >Hans Reiser wrote:
> >
> >
> >>Edward Shishkin wrote:
> >>
> >>
> >>
> >>>Gregor Zeitlinger wrote:
> >>>
> >>>
> >>>
> >>>
> >>>>Hi,
> >>>>
> >>>>I'm new to this list. I'm wondering how the file plugins work. Are they
> >>>>just a means of accessing the file contents or are they also designed to
> >>>>save the file differently.
> >>>>
> >>>>For example, could you create a plugin that automatically zips each
> >>>>text/plain file, which is totally transparent to the user?
> >>>>
> >>>>
> >>>>
> >>>>
> >>>Yeah, we could. Although transparentness means a bit worse compression..
> >>>
> >>>
> >>>
> >>?
> >>
> >>You mean because of choosing to use compression atoms
> >>
> >>
> >
> >Yes, but it is not the only reason.
> >
> >
> >
> >>that are node sized?
> >>
> >>
> >
> >No, compression atoms are limited by common sense ;)
> >Obviously, it doesn't make sense to choose it less then node size, if you
> >want to compress a file presented by tails. On the other hand, I am not
> >sure if you will be delighted from transparent compression supported by 256K
> >clusters even for larger files.
> >
> >
> >
> >> Maybe it might be more precise to say that efficient random
> >>access motivates small compression atoms which are less efficient?
> >> (Assuming that I understood you.)
> >>
> >>
> >
> >There is one more obscured reason that makes transparent compression worser.
> >I have to remind that its primary assignment is the same: to provide more
> >efficient disk space usage. Let's take a look how transparent compression
> >and the package using the same compression algorithm will provide it:
> >Suppose we want to compress a 8S-byte file, and both transparent compression
> >and package is supported by 4-blocks clusters, S - block size.
> >
> > File system:
> >divides the file into 2 clusters, suppose each cluster was compressed up to
> >(2S+1) bytes, so compressed file occupies 6 blocks.
> > Package:
> >makes compressed file which occupies 2*(2S+1) = 4S+2 bytes and passes it
> >to the file system, which places it (aieee!) into 5 blocks..
> >
> >  So we do have the actual compression ratio produced by the file system is
> >6/8 = 25% against actual ones (5/8 = 37,5%) produced by the package. The user
> >can observe this effect only by using "du" (when he does "df", he see that
> >file system and package produce the same compression ratio 37,5%).
> >This is another effect caused by the specific of packing policy (for the
> >ext2 files, reiserfs files presented by indirect items, etc..) Obviously
> >we can avoid this by using bigger cluster (8 blocks).
> >
> >Edward.
> >
> >
> >
> >
> Or by not block aligning the clusters, which might be the right
> solution,

It is impossible for the files presented by indirect items, since
it means you'll place dead space in memory per file.
 
> and might allow for compression atoms larger than nodes.
>  Please consider that approach.
> 
> Hans
