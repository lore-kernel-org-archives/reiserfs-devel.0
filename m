From: Brian Tinsley <btlists@emageon.com>
Subject: Re: getting UUID and label of a filesystem
Date: Wed, 12 Nov 2003 09:32:28 -0600
Message-ID: <1068651147.2027.10.camel@dragonball>
References: <3FAAB330.5040503@nrao.edu>
	 <1068152277.2556.13.camel@redeeman.linux.dk>
	 <1068152634.2455.37.camel@dragonball> <3FAFEE88.3040002@ysu.edu>
	 <20031110134246.N10197@schatzie.adilger.int>  <3FB2370E.4000102@ysu.edu>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-UALLm+YEdyaVPACkgzn9"
Return-path: <reiserfs-list-return-16059-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB2370E.4000102@ysu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: John Dalbec <jpdalbec@ysu.edu>
Cc: Andreas Dilger <adilger@clusterfs.com>, reiserfs-list@namesys.com

--=-UALLm+YEdyaVPACkgzn9
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2003-11-12 at 07:35, John Dalbec wrote:

> Andreas Dilger wrote:
> > "mount" has not been updated to use libblkid.  I had always intended on
> > doing that, but it was never in the top 10 on my todo list.  I had agreement
> > in principle from Andries Brouwer to use a libblkid in mount instead of
> > having a duplicate set of LABEL/UUID parsing code there, but just lacked
> > the time/incentive to do that part.
> > 
> > It would probably benefit all reiserfs users to get this working, so that
> > you can finally mount reiserfs filesystems by LABEL/UUID, so if someone
> > has some time and wants to contribute back to reiserfs this is a fairly
> > easy project (not kernel hacking ;-).
> 
> Brian Tinsley wrote:
> > I use labels on SuSE with no problem. Could be an incompatibility with 
> > your mount command, but I'm not sure.
> 
> Has SuSE already updated the mount command to use libblkid then?  Or did they 
> insert duplicate LABEL/UUID parsing code for ReiserFS?
> John


There is a libblkid on my SuSE 9 laptop, but I don't see it on
Enterprise Server 8. The mount command on version 9 doesn't appear to be
linked to libblkid, so it's probably a safe assumption to say that they
modified the mount command on both.


--=-UALLm+YEdyaVPACkgzn9--

