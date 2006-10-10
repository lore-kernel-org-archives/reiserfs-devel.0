From: Christopher Sawtell <csawtell@paradise.net.nz>
Subject: Re: Reiser4: Running out of room still causes corruption
Date: Wed, 11 Oct 2006 01:40:06 +1300
Message-ID: <200610110140.08598.csawtell@paradise.net.nz>
References: <452B343E.1020402@nusconsulting.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30025-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <452B343E.1020402@nusconsulting.com.au>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 10 October 2006 18:48, Daniel Kasak wrote:
> I'd had more problems with filesystem corruption after running out of
> space.
So have I, while using Ktorrent on one occasion and rsync to update a portage 
tree on the other.

Both caused fairly massive filesystem corruption, i.e. 200+ files or 
directories being described as recoverable errors, yet they produced error 
messages when fsck.reiser4 was run with --fix. Then 200+ objects turned up in 
lost+found. I do hope this problem can be fixed because in all other features 
reiser4 is an _excellent_ file system.

If there is anything I, as an experienced user, but not much of a programmer 
any more, can do please ask.

Sorry, but I have not made any records of error messages.

I have a spare disk on the end of a USB wire with which I am happy to 
experiment.

--
Christopher Sawtell.
