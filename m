From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: making reiser4/AMD64 hardlock
Date: Thu, 04 Nov 2004 13:39:10 +0300
Message-ID: <1099564739.2549.25.camel@tribesman.namesys.com>
References: <1099472359.8158.36.camel@localhost>
	 <20041103201825.GY30438@hvs.envisage.co.za>
	 <1099561964.1492.20.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22272-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1099561964.1492.20.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2004-11-04 at 12:52, Vladimir Saveliev wrote:
> Hello
> 
> On Wed, 2004-11-03 at 23:18, Hendrik Visage wrote:
> > On Wed, Nov 03, 2004 at 02:59:19AM -0600, Jake Maciejewski wrote:
> > > I've been testing reiser4 on 2.6.9 (patches from 2.6.9-mm1 and fixes
> > > from reiser4-for-2.6.9.diff). I have reiser4progs and libaal 1.0.1.
> > > Syslog doesn't catch any errors when I get hardlocks (haven't tried
> > > SysRq). I figured I could at least give you guys a hint about what kind
> > > of usage pattern kills reiser4.
> > 
> 
> Please try to get as much debugging information as you can.
> sysrq+t's output may help to understand the problem. Do you have "File
> systems" -> "Reiser4" -> "Enable reiser4 debug options" -> "Assertions"
> turned on? If no, please turn it, it may also help. Try to catch its
> output, via serial console if it will not be stored in logs.
> 
> I will try your test in x86.
> 
It does not hardlock here on x86

> > I recall the last response about this issue:
> > 
> >  We need an AMD64 cpu...
> > 
> well, yes.
> 
> > 
> 
> 

