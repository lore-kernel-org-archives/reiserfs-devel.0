From: Dan Nilsson <zyrax@home.se>
Subject: Re: Reoccuring corruption problem
Date: Sat, 21 Aug 2004 07:43:41 +0200
Message-ID: <200408210743.41317.zyrax@home.se>
References: <200408192046.27223.zyrax@home.se> <20040819194222.GC29745@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20447-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040819194222.GC29745@favonius>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: reiserfs-list@namesys.com

> Sounds like bad memory nevertheless. Can you try memtest86 for at least
> 24 hours?

Yes,
I put the computer running memtest86 after getting your email and it did in 
fact pass all tests (after ~24hrs i aborted the test). 

I have fairly recently upgraded the computer by adding a memory module which i 
suspected would show up the errors (if any).

After running the test I fsck:ed to remove the corruptions, then proceeded by 
removed my /usr/portage tree (where corruptions seem to easily occur) and 
reinstalled all the files (with rsync). The same type of corruption occured 
but now to a different directory than "usual". 

I have absolutely no idea what causes it. Nothing shows up in syslog and there 
doesn't seem to be any problems with the hard drive (which, by the way is a 
2Gb drive with the corruptions occuring on a 1.6 Gb partition).

Thanks,
Dan Nilsson
