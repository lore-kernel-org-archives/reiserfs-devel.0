From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: plagiarism of reiserfs by Debian
Date: Sat, 19 Apr 2003 16:25:57 -0600
Message-ID: <20030419162557.U26054@schatzie.adilger.int>
References: <143CBAC4-7291-11D7-ADF3-00050285B655@ncpro.com> <3EA19DEC.3090202@techhouse.org> <20030419205555.GY2528@phunnypharm.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13728-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030419205555.GY2528@phunnypharm.org>; from bcollins@debian.org on Sat, Apr 19, 2003 at 04:55:55PM -0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Collins <bcollins@debian.org>
Cc: Travis Crump <pretzalz@techhouse.org>, Marcel Weber <mmweber@ncpro.com>, Hans Reiser <reiser@namesys.com>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, debian-testing@lists.debian.org, Ed Boraas <ed@debian.org>, debian-devel@lists.debian.org

On Apr 19, 2003  16:55 -0400, Ben Collins wrote:
> > all that was removed was *code* that gets compiled.  If the maintainer 
> > cannot arbitrarily change any code he wants, then it is not clear that 
> > the program is DFSG-free.
> 
> Amen. Making part of the code immutable is not what I call free
> software. What if I want to use parts of the code and I respect the
> copyright and license...does that mean I also have to take this part of
> the code and output the credits? What if environment doesn't provide a
> way to output the credits. What if I am implementing the reiser tools on
> an embedded system that will never show any such output?

I'm sure all the FSF/Debian folks would be thrilled if someone changed the
code in [x]emacs to not output anything about the GPL at startup, or if vim
didn't include any info about helping Ugandan orphans.

I'm not saying that I've ever liked the verbosity of the messages in
mkreiserfs, but at the same time I wouldn't ever remove them out of
courtesy to the author, regardless of whether it is in the license or not.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

