From: Chris Mason <mason@suse.com>
Subject: Re: write barrier patches for 2.4.21
Date: 27 Aug 2003 20:37:40 -0400
Message-ID: <1062031059.5324.111.camel@tiny.suse.com>
References: <20030825170849.GA14811@mfa.kfki.hu> <20030826214624.GA410@zero>
	 <20030827064103.GA29131@namesys.com>  <20030827220337.GB4886@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15464-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030827220337.GB4886@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: Reiserfs List <reiserfs-list@namesys.com>

On Wed, 2003-08-27 at 18:03, Tom Vier wrote:
> On Wed, Aug 27, 2003 at 10:41:03AM +0400, Oleg Drokin wrote:
> > There was a discussion about that on Kernel Summit 2003 and general opinion was that SCSI
> > does not need the WB stuff at all as it does the correct thing anyway.
> 
> i found this, but no real details. do you have a better link? or could you
> tell me why scsi drives don't need wb's? afaik, they don't have nvram cache.
> so, the danger is still there, even if small (unless i'm wrong).
> 
> http://lwn.net/Articles/40850/
> 

scsi drives don't really need them because most scsi drives don't have
write back caching on by default, and most actually listen when you turn
the cache off.  The scsi tag queuing makes good performance possible
even without writeback caching.

-chris


