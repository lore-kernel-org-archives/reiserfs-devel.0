From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: bug report?
Date: Fri, 21 May 2004 15:11:09 -0400
Message-ID: <40AE544D.40503@suse.com>
References: <40AE4D4B.80803@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18814-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40AE4D4B.80803@baldauf.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Xuan Baldauf <xuan--2004.05.21--reiserfs-list--namesys.com@baldauf.org>
Cc: reiserfs-list@namesys.com

Xuan Baldauf wrote:
> Hello,
> 
> I just want to report what happens if a ide controller (or cabling 
> thereof) gets mad. The reiserfs filesystem was not unmountable after 
> that event. Maybe reiserfs should not panic in such an event? (It could 
> keep buffers dirty and allow unclean unmounts so that the gone 
> filesystem could be unlinked from the VFS)

This happens if any I/O failure occurs while accessing the journal.

I have patches that allow the filesystem to abort if an I/O failure in 
the journal occurs. The result is that the filesystem is forced 
read-only, processes waiting to start a transaction will be refused, and 
existing transactions will be allowed to complete, but not commit. 
Appropriate error codes are returned to the user.

Once the normal conditions for umounting a filesystem are met (no open 
files, etc), it can be umounted normally. The resulting filesystem will 
be identical do what would happen if the machine were simply unplugged 
at the point of the abort. Committed transactions in the journal will be 
replayed on remount, and life goes on. Obviously, additional action as 
appropriate to the cause of the error may be required.

Chris Mason is in the process of sending these to akpm for inclusion in 
-mm, and ultimately in mainline. There were a number of dependencies 
that these patches required, which have been in the process of being 
accepted. Now that the dependencies are met, these patches can be submitted.

-Jeff

-- 
Jeff Mahoney
SuSE Labs
