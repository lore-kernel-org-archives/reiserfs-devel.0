From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4 panicked cowardly: assertion failed: hint->blk < reiser4_block_count(super)
Date: Tue, 7 Jun 2005 14:32:11 +0400
Message-ID: <200506071432.11752.vitaly@namesys.com>
References: <20050605165029.386dc82e.reiser4@blinkenlights.ch> <200506071100.44749.vitaly@namesys.com> <20050607130111.39bda1f2.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24340-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050607130111.39bda1f2.reiser4@blinkenlights.ch>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: reiserfs-list@namesys.com

On Tuesday 07 June 2005 15:01, Adrian Ulrich wrote:
> Hi Vitaly,
> 
> > there was a format change to work with encryption plugin in 
> > -5 reiser4 patch. progs do not have its support yet. grub works 
> > through the progs code so its the same problem, mkisofs is not 
> > relevant here.
> 
> I don't think thats the problem:

I am about the particular fsck message that appeares when you 
use -5 reiser4 patch: 

> > FSCK: Node (411219), item (0), [29:1(SD):0:2a:0]: does not look 
> > like a valid SD plugin set extention: wrong pset member count detected (12). 



> It looks like a remount bug:
>  See <20050607065750.4dd203b9.reiser4@blinkenlights.ch> (my other mail)
> 
