From: Sander <sander@humilis.net>
Subject: Re: Reoccuring corruption problem
Date: Sat, 21 Aug 2004 10:16:13 +0200
Message-ID: <20040821081613.GC10308@favonius>
References: <200408192046.27223.zyrax@home.se> <20040819194222.GC29745@favonius> <200408210743.41317.zyrax@home.se>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20451-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408210743.41317.zyrax@home.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Nilsson <zyrax@home.se>
Cc: reiserfs-list@namesys.com

Dan Nilsson wrote (ao):
> > Sounds like bad memory nevertheless. Can you try memtest86 for at least
> > 24 hours?
> 
> Yes,
> I put the computer running memtest86 after getting your email and it
> did in fact pass all tests (after ~24hrs i aborted the test). 
> 
> I have fairly recently upgraded the computer by adding a memory module
> which i suspected would show up the errors (if any).
> 
> After running the test I fsck:ed to remove the corruptions, then
> proceeded by removed my /usr/portage tree (where corruptions seem to
> easily occur) and reinstalled all the files (with rsync). The same
> type of corruption occured but now to a different directory than
> "usual". 

You seem to be able to trigger it fast and easy. Can you try again with
the added memory module removed? I'm a bit stubborn .. ;-)

It must be something with your hardware, as you are the only one, and
also the kind of corruption is common with broken hardware.
