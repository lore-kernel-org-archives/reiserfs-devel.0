From: John Dalbec <jpdalbec@ysu.edu>
Subject: Re: getting UUID and label of a filesystem
Date: Wed, 12 Nov 2003 08:35:10 -0500
Message-ID: <3FB2370E.4000102@ysu.edu>
References: <3FAAB330.5040503@nrao.edu> <1068152277.2556.13.camel@redeeman.linux.dk> <1068152634.2455.37.camel@dragonball> <3FAFEE88.3040002@ysu.edu> <20031110134246.N10197@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16058-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031110134246.N10197@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Brian Tinsley <btlists@emageon.com>, reiserfs-list@namesys.com

Andreas Dilger wrote:
> "mount" has not been updated to use libblkid.  I had always intended on
> doing that, but it was never in the top 10 on my todo list.  I had agreement
> in principle from Andries Brouwer to use a libblkid in mount instead of
> having a duplicate set of LABEL/UUID parsing code there, but just lacked
> the time/incentive to do that part.
> 
> It would probably benefit all reiserfs users to get this working, so that
> you can finally mount reiserfs filesystems by LABEL/UUID, so if someone
> has some time and wants to contribute back to reiserfs this is a fairly
> easy project (not kernel hacking ;-).

Brian Tinsley wrote:
> I use labels on SuSE with no problem. Could be an incompatibility with 
> your mount command, but I'm not sure.

Has SuSE already updated the mount command to use libblkid then?  Or did they 
insert duplicate LABEL/UUID parsing code for ReiserFS?
John

