From: Lee Revell <rlrevell@joe-job.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 15:26:55 -0400
Message-ID: <1093548414.5678.74.camel@krustophenia.net>
References: <20040824202521.GA26705@lst.de>	<412CEE38.1080707@namesys.com>
	 <20040825152805.45a1ce64.akpm@osdl.org>	<412D9FE6.9050307@namesys.com>
	 <20040826014542.4bfe7cc3.akpm@osdl.org>  <412DAC59.4010508@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20766-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412DAC59.4010508@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

On Thu, 2004-08-26 at 05:24, Hans Reiser wrote:
> Andrew Morton wrote:
> >
> >And describe the "plugin" system.  Why does the filesystem need such a
> >thing (other filesystems get their features via `patch -p1')?
> >  
> >
> It takes 6 months or more to become competent to change a usual 
> filesystem.  Creating a new reiser4 plugin is a weekend programmer fun 
> hack to do.  Weekend programmers matter, because they tend to have 
> clever ideas based on understanding a need they have.   How many people 
> can easily add new features to ext3 or reiserfs V3?  Very few. 
> 
> What happens if you need a disk format change?
> 
> Well, in V4, you can easily compose a plugin from plugin methods of 
> other plugins, write a little piece of code with the one thing you want 
> different, and add it in.  Disk format changes, no big deal, add a new 
> disk format plugin, or a new item plugin, or a new node plugin, etc., 
> and you got your new format.
> 

OK, real world example.  My roommate has an AKAI MPC-2000, a very
popular hardware sampler from the 90's.  The disk format is known,there
are a few utilities to edit the disks on a PC and extract the PCM
samples, but there are no tools to mount it on a modern PC.  Are you
saying that, since I know the MPC disk format, I could write a reiser4
plugin to mount an MPC drive?

If so, then Hans has an excellent point.  Users do want this kind of
thing, and it is worth having to fix tar et al.

Lee 

