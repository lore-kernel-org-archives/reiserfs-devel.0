From: Oleg Drokin <green@namesys.com>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Fri, 17 May 2002 22:28:47 +0400
Message-ID: <20020517222846.A1514@namesys.com>
References: <200205171736.50971.Dieter.Nuetzel@hamburg.de> <20020517195445.A1032@namesys.com> <200205171905.30804.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10373-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200205171905.30804.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, Manuel Krause <manuelkrause@netscape.net>, ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Fri, May 17, 2002 at 07:05:30PM +0200, Dieter N?tzel wrote:
> > What is the corruption pattern?
> Have a look into the two examples.

I will, but later, it seems.

> > What was the crash, btw?
> > Hard power loss?
> No.
> "Only" hard lookup. Sadly SysReq is not working ;-(

And you fix it by "reset switch"?

BTW, Was that you with a kernel with lot of patches applied, or
you do not use anything strange on your workstations?

> > > written before/during crash and rebuild during replay, but it should much
> > > more usefull if they were only _REMOVED_ during replay. Because the
> > > "next" kernel build can't run smooth without "make clean" or deletion by
> > > hand. What do you think?
> > These files are not deleted, so why fs should delete these?
> Yes, you are right. But semantically they are worthless 'cause they are 
> "broken"...

FS cannot know this. Absolutely cannot.
File was created, written into. So file appears after reboot (if transaction
in which it was created was commited).
BTW, I have a feeling that datalogging patches would help to get rid of
garbage in the files, but files still will remain (may be of zero length).

> > > Have a look into the falsely "rebuild" broken files in the attachment,
> > > too.
> > Later today
> Hey, it's weekend then...;-)

So what? ;)

> Happy Whitsun everyone!

Hm. What's that? ;)

Bye,
    Oleg
