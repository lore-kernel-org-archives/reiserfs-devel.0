From: Redeeman <redeeman@metanurb.dk>
Subject: Re: History plugin in ReiserFS?
Date: Mon, 31 Oct 2005 21:46:04 +0100
Message-ID: <1130791564.24394.5.camel@localhost>
References: <52152.80.235.110.72.1130698205.squirrel@mailhost.ut.ee>
	 <43651B50.1080200@namesys.com>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26746-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43651B50.1080200@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Toomas Laasik <t008@ut.ee>, reiserfs-list@namesys.com

On Sun, 2005-10-30 at 11:13 -0800, Hans Reiser wrote:
> Toomas Laasik wrote:
> 
> >Hello,
> >
> >I was wondering if reiserfs has some sort of history plugin. I want a
> >filesystem that manages files similar to CVS or SVN so that I can say for
> >example that "I want asdasd.txt file exactly as it was on 15.10.2005
> >14:20:05" and I can get it. Of cource keeping that kind of "changelog"
> >takes much room on disk, but I assume one could set a percentage of disk
> >space for history and/or max days to keep history from.
> >  
> >
> Nothing yet exists, it should be done, and I encourage the doing of it.
> 
it is not implemented directly in the kernel yet, afaik, but fuse
filesystems do exists which does this, i know of two, which can
accomplish it.
cvsfs - it mounts cvs, thus having version control, but requires cvs
server
http://sourceforge.net/projects/cvsfs

then there is wayback, which is kinda a bridge between any filesystem,
and the version controlled, so lets say you have /mnt/bigstorage, with a
mofo raid mounted, then you do this:
mkdir /mnt/cvsfs
fusemount wayback_thing /mnt/bigstorage /mnt/cvsfs..
^^ not how you do, but you get the idea.
http://wayback.sourceforge.net/

> >It is one of my university projects to make this kind of filesystem or
> >modify some existing filesystem eg ReiserFS.
> >  
> >
> Please send a design document.
> 
> >Any sugestions how to implement or where to start? Is something like that
> >made already? Do you think that extending ReiserFS would be a good option?
> >  
> >
> Yes.
> 
> >I searched Google trying to find some material about writing ReiserFS
> >plugins, but found very little useful. 
> >
> The assumption made is that people who write plugins read the source
> code.;-)   We get complaints from people about  our comments being too
> long (oy veh), so.....
> 
> The other thing to do is to join our developers list, and ask lots of
> questions.
> 
> >Maybe it's easier to start from
> >scratch? The goal is not to make production safe filesystem, but just
> >accomplish my task.
> >
> Why bother to write code if a few million aren't going to use it?  It is
> always better to write less code and get it stable so it is widely
> used......
> 
> 
> > Of cource if it is possible I would like that what I
> >do is useful not only to me but for others who might want something
> >similar too.
> >
> >Thanks in advance,
> >
> >Toomas
> >
> >
> >
> >  
> >
> welcome to our community.
> 
> Hans
> 
-- 
Redeeman <redeeman@metanurb.dk>

