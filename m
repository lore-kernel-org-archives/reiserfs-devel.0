From: "Martin J. Bligh" <mbligh@aracnet.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 13:44:06 -0700
Message-ID: <45010000.1093553046@flay>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408261101110.2304@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20796-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408261101110.2304@ppc970.osdl.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@osdl.org>, Rik van Riel <riel@redhat.com>
Cc: Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

--On Thursday, August 26, 2004 11:15:19 -0700 Linus Torvalds <torvalds@osdl.org> wrote:
> On Thu, 26 Aug 2004, Rik van Riel wrote:
>> 
>> It's a relief to know that nobody's taking my humorous
>> suggestion seriously, but now we still have the "standard
>> Unix tools can't manipulate files" problem...
> 
> I disagree. They can manipulate the files a whole lot better than they can 
> manipulate xattr's.
> 
> For example, you _could_ probably (but hey, maybe "tar" tries to strip
> slashes off the end of filenames, so this might not work due to silly
> reasons like that) back up a compound file with
> 
> 	tar cvf file.tar file file/
> 
> although unpacking it would require that tar be taught about the thing. 
> And you definitely could write a script to do the thing, ie even with an 
> unmodified tar you could do
> 
> 	tar cvf file-archive.tar file
> 	cd file
> 	tar cvf ../attribute-archive.tar .
> 
> which is a hell of a lot better than what you can do with the fsattr 
> interfaces and unmodified legacy applications.
> 
> So one of the advantages of "dir-as-file/file-as-dir" is exactly that you
> _can_ manipulate the data with legacy tools. Sure, things that traverse a
> directory tree might need some (likely fairly trivial) modifications if
> they really want to take advantage of the subfiles, but that's still
> likely to be _much_ less of an issue than with fsattr's that have a 
> totally different model entirely.

What would "test -d" and "test -f" return on these magic beasties? I can't
think of any combinations that wouldn't confuse the crap out of userspace.

M.

