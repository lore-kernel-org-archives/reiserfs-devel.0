From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: getting UUID and label of a filesystem
Date: Mon, 10 Nov 2003 13:42:46 -0700
Message-ID: <20031110134246.N10197@schatzie.adilger.int>
References: <3FAAB330.5040503@nrao.edu> <1068152277.2556.13.camel@redeeman.linux.dk> <1068152634.2455.37.camel@dragonball> <3FAFEE88.3040002@ysu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16043-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3FAFEE88.3040002@ysu.edu>; from jpdalbec@ysu.edu on Mon, Nov 10, 2003 at 03:01:12PM -0500
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Dalbec <jpdalbec@ysu.edu>
Cc: Brian Tinsley <btlists@emageon.com>, reiserfs-list@namesys.com

On Nov 10, 2003  15:01 -0500, John Dalbec wrote:
> I set labels on my ReiserFS filesystems, but I can't use LABEL= in /etc/fstab. 
> I thought that was the point of having filesystem labels.  Is there some 
> configuration setting that I'm missing?

"mount" has not been updated to use libblkid.  I had always intended on
doing that, but it was never in the top 10 on my todo list.  I had agreement
in principle from Andries Brouwer to use a libblkid in mount instead of
having a duplicate set of LABEL/UUID parsing code there, but just lacked
the time/incentive to do that part.

It would probably benefit all reiserfs users to get this working, so that
you can finally mount reiserfs filesystems by LABEL/UUID, so if someone
has some time and wants to contribute back to reiserfs this is a fairly
easy project (not kernel hacking ;-).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

