From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: data corruption with 2.4.25 and datalogging patches
Date: Fri, 14 Jul 2006 15:48:59 +0400
Message-ID: <1152877739.6407.37.camel@tribesman.namesys.com>
References: <200607120816.11292.fjcabello@visual-tools.com>
	 <1152801263.6353.147.camel@tribesman.namesys.com>
	 <200607141026.03556.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607141026.03556.fjcabello@visual-tools.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francisco Javier Cabello <fjcabello@visual-tools.com>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2006-07-14 at 10:25 +0200, Francisco Javier Cabello wrote:
> Hello,
> I am almost sure that unclean shutdowns happen in those systems. We have tried 
> to reproduce removing power each 5 minutes and the filesystem wasn't 
> suffering corruption. Perhaps it's related, but I don't know.
> 
> I have talked about 'Datalogging patches' because it's the only thing 
> different from our system. 

sorry, I am confused. Am I correct that you have set of systems and they
all run similar load on the same kernel and only ~10% of them encounter
reiserfs corruptions? Do they have identical hardware?

> I have searched a lot and  few people have 
> corruption with reiserfs standalone... so, it may be datalogging patches.
> 
> what do you need from reiserfsck? I guess the output of 'reiserfsck --check 
> device' 

yes. There is -l option to redirect output to log file.

> of perhaps you need the output of reiserfsck --rebuild tree.
> 
> 
> Regards,
> 
> Paco
> 
> 
> 
> 
> On Thursday, 13 de July de 2006 16:34, Vladimir V. Saveliev wrote:
> > Hello
> >
> > On Wed, 2006-07-12 at 08:16 +0200, Francisco Javier Cabello wrote:
> > > Hello,
> > > My company develops video recorder system. Basically we work with linux
> > > boxes running kernel 2.4.25. The system captures analogue video,  and
> > > after processing and compressing, digital video is stored to hard disk.
> > > We are recording continuously (24x7).
> > >
> > > We have realized that more or less a 10% of our systems are suffering
> > > data corruption in the reiserfs partition.
> >
> > Did unclean shutdowns take place on those systems?
> > If you let us see what does reiserfsck report in those cases that could
> > help to understand what is is happening.
> >
> > > Sometimes it's possible to fix it
> > > running 'reiserfsck --rebuild-tree' but not always.
> > > More information:
> > > -Kernel 2.4.25 + v4l2 patches
> > > -Reiserfsprogs 3.6.19
> > > -Datalogging patches.
> > > (http://mirror.mcs.anl.gov/suse-people/mason/patches/data-logging/2.4.25/
> > >)
> > >
> > > I have checked datalogging patches from Reiserfs website and they seem
> > > equal to suse ones.
> > >
> > > I don't have any idea of what it's happening. The disk bandwidth is not
> > > so high (300-500kb/sec). The disk is always full at 90% (we have a
> > > process deleting old video).
> > >
> > > I have been thinking about removing Dataloggin patches but I would like
> > > to have serious reason. It's not easy to check that the problem is solved
> > > because we are not able to reproduce the error in our headquarter.
> > >
> > > Regards,
> > >
> > > Paco
> 

