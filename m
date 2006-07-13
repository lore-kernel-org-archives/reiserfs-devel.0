From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Wed, 12 Jul 2006 21:00:27 -0700
Message-ID: <20060712210027.8d7a2ddc.akpm@osdl.org>
References: <44B52674.8060802@suse.com>
	<20060712175542.108e6e37.akpm@osdl.org>
	<44B5C353.9060007@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28984-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44B5C353.9060007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: jeffm@suse.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Wed, 12 Jul 2006 20:51:47 -0700
Hans Reiser <reiser@namesys.com> wrote:

> Andrew Morton wrote:
> 
> >On Wed, 12 Jul 2006 12:42:28 -0400
> >Jeff Mahoney <jeffm@suse.com> wrote:
> >
> >  
> >
> >> On systems with block devices containing slashes (virtual dasd, cciss,
> >> etc), reiserfs will fail to initialize /proc/fs/reiserfs/<dev> due to
> >> it being interpreted as a subdirectory. The generic block device code
> >> changes the / to ! for use in the sysfs tree. This patch uses that
> >> convention.
> >>    
> >>
> >
> >Isn't it a bit dumb of us to be putting slashes in the device names anyway?
> > It would be better, if poss, to alter dasd/cciss/etc and stop all these
> >s@/@!@everywhere games.
> >
> >
> >  
> >
> Isn't better to ask why there is a problem with the /'s?  It would be
> bad for Linux as a design to prevent passing arbitrary tail ends of
> filenames off to arbitrary plugins of some kind.  In general, in
> namespace design, you want to allow delegating the job of
> resolving/interpreting the tail end of a file that the front end has
> identified as something that can interpret it.
> 
> Forgive me, I probably understand something wongly about procfs and this
> issue....
> 

It's a question of being *practical*.  Your observations are in the realm
of the theoretical.

Software sucks, and we get along better by not provoking it.  So don't put
spaces, let alone slashes into strings which we offer to userspace.
