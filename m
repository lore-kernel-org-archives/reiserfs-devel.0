From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: Reiser4 & Files/Directories question
Date: Thu, 08 Sep 2005 14:28:39 -0500
Message-ID: <1126207719.27894.3.camel@gentoo>
References: <43208654.7040502@sourcelabs.com>
	 <4320889C.7070205@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25902-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4320889C.7070205@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Ross Jekel <ross@sourcelabs.com>, reiserfs-list@namesys.com

On Thu, 2005-09-08 at 13:53 -0500, David Masover wrote:
> Ross Jekel wrote:
> > Newbie question as I'm evaluating Reiser4 as a storage solution for a 
> > project I'm working on.
> > 
> > It appears Reiser4 has the ability to have a file name be both the name 
> > for the file data and a directory. Can I take advantage of this at the 
> > application level?
> 
> I think there's a mount option to turn this behavior back on, but it's 
> not on at the moment due to HUGE flamefests on the kernel lists.  We 
> don't know if it's coming back anytime soon, or if it'll resemble what 
> you're thinking when it does.
> 
> For now, I think there might still be a '-o metas' option, or something 
> similar.

I don't know about mount options, but I've enabled metas by changing
"#define ENABLE_REISER4_PSEUDO (0)" to "#define ENABLE_REISER4_PSEUDO
(1)" in fs/reiser4/reiser4.h

> > For instance, can I use python to access the file data directly, and 
> > access the directory information as well to open any attribute files I 
> > might want to put in there? Or is that functionality only available 
> > through non-posix calls from file system plugins and such.
> 
> It will eventually be available through a non-posix call, and maybe 
> (hopefully, you paying attention, Namesys?) in some limited way from the 
> xattr calls.
> 
> > I was interested in the design of the livingxml.net solution from the 
> > testimonials page, but that site is no longer available. Is there a 
> > project or design document somewhere that summarizes the best way of 
> > using reiser4 as a database of content with additional metadata for each 
> > document?
> 
> AFAIK, livingxml was based on reiserfs3, and it had nothing to do with 
> non-standard extensions to the FS, but rather with the fact that v3 (and 
> v4) is fast with small text files, making it a good choice for web, 
> email, XML, or anything else small and text-y.  Even more so after we 
> get the compression plugin.
> 
> > Forgive me if this is answered somewhere. I've searched some mailing 
> > list archives site and couldn't find the exact answer.
> 
> Maybe not, but if you search the archive for "Silent Semantic Changes in 
> Reiser4"  (or something very similar), you'll find a very long thread on 
> why Reiser4 doesn't (currently) support files as directories.
> 
-- 
Jake Maciejewski <maciejej@msoe.edu>

