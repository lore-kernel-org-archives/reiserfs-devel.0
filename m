From: Chris Worley <cworley@symbionsys.com>
Subject: Re: SUSE 9.1 with ReiserFS:  / won't fsck, but is otherwise fine
Date: Fri, 24 Sep 2004 08:58:41 -0600
Message-ID: <1096037921.17001.20.camel@xserver.local.net>
References: <1095996040.10293.18.camel@xserver.local.net>
	 <200409241116.09066.vitaly@namesys.com>
	 <1096032016.17001.4.camel@xserver.local.net>
	 <20040924133052.GA1617@hvs.envisage.co.za>
	 <1096034190.17001.14.camel@xserver.local.net>
	 <20040924143210.GG1617@hvs.envisage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21906-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040924143210.GG1617@hvs.envisage.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hendrik Visage <hvisage@envisage.co.za>
Cc: reiserfs-list@namesys.com

On Fri, 2004-09-24 at 08:32, Hendrik Visage wrote:
> On Fri, Sep 24, 2004 at 07:56:31AM -0600, Chris Worley wrote:
> > On Fri, 2004-09-24 at 07:30, Hendrik Visage wrote:
> > > 1) Why do you *want* to fsck a reiserfs? Unless you have troubles, then a
> > > fsck on a reiserfs is not needed by design of a logging/journaling fs
> > 
> > You don't have a choice on the root file system... fsck will be run.
> 
> Then ignore it for a reiserfs...
> 
> > If there's really nothing wrong with the FS, then I'm okay just making a
> > no-op fsck.reiserfs and leaving it at that... I'm just worried that
> > something is really wrong with the file system, and I need to fix that. 
> > As it sits atop an LVM, I want to add a few more partitions to the LVM
> > and extend the Reiser fs... but I'm paranoid, with this error, to
> > proceed.
> 
> First understand a logging/journaling fs :)

I do understand a journaling fs, and have used Reiser for many years. 
My understanding of journaling fs's is not the problem.  There was a
time when this fs properly fsck'd at boot, and then a time when it
didn't.  This is a problem.  Furthermore, SuSE would not have forced the
fsck (irrespective of the fstab settings) of the root fs if it didn't
apply to Reiser.

Please re-read my original email, as I don't think you understand the
situation.

Thanks,

Chris

