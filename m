From: Chris Mason <mason@suse.com>
Subject: Re: [BUG] tons of logging patches
Date: 16 Jun 2002 16:54:20 -0400
Message-ID: <1024260860.11287.45.camel@tiny>
References: <200206072332.29892.tomlins@cam.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200206072332.29892.tomlins@cam.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ed Tomlinson <tomlins@cam.org>
Cc: reiserfs-list@namesys.com

On Fri, 2002-06-07 at 23:32, Ed Tomlinson wrote:
> Hi,
> 
> On pre10-ac2 with your:
> 
> 01-relocation-3.diff  
> 02-commit_super-8-relocation.diff  
> 03-beta-data-logging-7.diff
> 
> Adpated for the O(1) scheduler which required replacing code in two places
> in journal.c with yield() and with by slab_in_lru patch, I found this in my log:
>

Hi Ed, thanks for trying these out.

Andrea hit this bug too, and one other oops.  I've got this one fixed
(one liner), and I'm working on the other.  Hopefully I'll have it all
figured out tomorrow.

-chris


