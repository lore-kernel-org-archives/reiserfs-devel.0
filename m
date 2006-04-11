From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Bug report: reiserfsck --rebuild-tree not progressing
Date: Tue, 11 Apr 2006 13:24:29 +0400
Message-ID: <1144747469.6188.36.camel@tribesman.namesys.com>
References: <b19177749f9fd8399d24c21c4f355efd@pandora.com>
	 <20060411072150.GA21772@favonius>
	 <B3A1FB37-26AC-49F0-8CDB-A14FC93BF021@pandora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28478-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <B3A1FB37-26AC-49F0-8CDB-A14FC93BF021@pandora.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tyler Phelps <tyler@pandora.com>
Cc: "Vitaly P. Fertman" <vitaly@namesys.com>, sander@humilis.net, System Administrators <sysadmin@pandora.com>, reiserfs-list@namesys.com

Hello

On Tue, 2006-04-11 at 01:12 -0700, Tyler Phelps wrote:
> My questions (and all of the diagnostic information provided) revolve  
> around a specific process of reiserfsck, using the version that I  
> specified, which is still running.  The only way that I can try a new  
> version is to abort the current fsck operation... doing that  
> essentially invalidates all of the questions that I've asked.
> 

> 1.  Is it normal for pass 2 of the --rebuild-tree operation to stay 
> at the same "progress" for more than 24 hours?
> 2.  Is it normal for the reiserfsck operation to use significant CPU 
> resources while I/O activity is minimal?

1-2: It is not normal but possible. Old reiserfsck (like the one you are
using) was extremly inefficient in some (rare) kind of corruptions).

> 3.  For a filesystem of such size, is it reasonable for the fsck to  
> take many days to complete?

Unfortunately, currently, reiserfsck takes a long time on big
filesystems.

> 4.  How long do you recommend that I leave it in this state before  
> aborting the fsck?

I would recommend you to abort it and try
ftp://ftp.namesys.com/pub/tmp/reiserfsprogs-3.6.20.tar.gz


> I'm reluctant to abort the current process.  My primary reason for  
> this is that I have no way of knowing if aborting the current fsck  
> will cause further damage.  After all, the man page states, "Once  
> reiserfsck --rebuild-tree is started it must finish its work (and you  
> should not interrupt it), otherwise the filesystem will be left in  
> the unmountable state to avoid subsequent data corruptions."  Second,  
> I don't know if anything is even wrong with the way that things are  
> "progressing" with the current process... hence the reason for my  
> original questions.
> 


> -Tyler
> 
> On Apr 11, 2006, at 12:21 AM, Sander wrote:
> 
> > Tyler Phelps wrote (ao):
> >> Package: reiserfsprogs
> >> Version: 1:3.6.17-2
> >
> > Can you try a newer version?
> > ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.gz
> >
> > According to http://marc.theaimsgroup.com/?t=114235160800008&r=1&w=2
> > 3.6.20 also exist, but I cant find it.
> >
> > 	Good luck, Sander
> >
> > -- 
> > Humilis IT Services and Solutions
> > http://www.humilis.net
> 
> 

