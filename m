From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs_file_write: item has been moved
Date: 02 Apr 2002 08:48:06 -0500
Message-ID: <1017755286.17572.13.camel@tiny>
References: <wvhemubol9.fsf@freeze.oslo.dnmi.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <wvhemubol9.fsf@freeze.oslo.dnmi.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Phillips <a.phillips@dnmi.no>
Cc: reiserfs-list@namesys.com

On Tue, 2002-04-02 at 01:29, Adrian Phillips wrote:
> 
> I got one of these in my logs :-
> 
> kernel: reiserfs_file_write: item has been moved while we were in copy_from_user (appending to the direct item)
> 

These are safe.  Recent 2.2.x kernels include a patch from andrea that
makes copy_from/to_user much more likely to schedule.  Whoever coded
reiserfs_file_write correctly realized it was possible for these calls
to schedule (and correctly dealt with it), but before they almost never
did schedule, so the debugging was probably forgotten.

-chris


