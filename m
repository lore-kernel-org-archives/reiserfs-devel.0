From: Tom Vier <tmv@comcast.net>
Subject: Re: write barrier patches for 2.4.21
Date: Thu, 28 Aug 2003 20:07:30 -0400
Message-ID: <20030829000730.GA9019@zero>
References: <20030825170849.GA14811@mfa.kfki.hu> <20030826214624.GA410@zero> <20030827064103.GA29131@namesys.com> <20030827220337.GB4886@zero> <1062031059.5324.111.camel@tiny.suse.com> <20030828170725.GB21352@matchmail.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15480-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030828170725.GB21352@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs List <reiserfs-list@namesys.com>

On Thu, Aug 28, 2003 at 10:07:25AM -0700, Mike Fedyk wrote:
> On Wed, Aug 27, 2003 at 08:37:40PM -0400, Chris Mason wrote:
> > scsi drives don't really need them because most scsi drives don't have
> > write back caching on by default, and most actually listen when you turn
> > the cache off.  The scsi tag queuing makes good performance possible
> > even without writeback caching.
> 
> So, in essence, TCQ is exposing what is happening in the cache, and allowing
> control/showing state compared to IDE's non-TCQ write cache.  Do I have that
> right?

i'm not sure what you mean. chris is just saying tcq makes performance w/o
write cache better. i WOULD like to see wb's used w/ scsi. it would be nice
to be able to safely enable write cache on my drives.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
