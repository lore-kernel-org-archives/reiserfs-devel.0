From: Chris Cheney <ccheney@cheney.cx>
Subject: Re: plagiarism of reiserfs by Debian
Date: Sat, 19 Apr 2003 18:06:54 -0500
Message-ID: <20030419230654.GF26352@cheney.cx>
References: <143CBAC4-7291-11D7-ADF3-00050285B655@ncpro.com> <3EA19DEC.3090202@techhouse.org> <20030419205555.GY2528@phunnypharm.org> <20030419162557.U26054@schatzie.adilger.int>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13729-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030419162557.U26054@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-devel@lists.debian.org
Cc: Ben Collins <bcollins@debian.org>, Travis Crump <pretzalz@techhouse.org>, Marcel Weber <mmweber@ncpro.com>, Hans Reiser <reiser@namesys.com>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, debian-testing@lists.debian.org, Ed Boraas <ed@debian.org>

On Sat, Apr 19, 2003 at 04:25:57PM -0600, Andreas Dilger wrote:
> On Apr 19, 2003  16:55 -0400, Ben Collins wrote:
> > > all that was removed was *code* that gets compiled.  If the maintainer 
> > > cannot arbitrarily change any code he wants, then it is not clear that 
> > > the program is DFSG-free.
> > 
> > Amen. Making part of the code immutable is not what I call free
> > software. What if I want to use parts of the code and I respect the
> > copyright and license...does that mean I also have to take this part of
> > the code and output the credits? What if environment doesn't provide a
> > way to output the credits. What if I am implementing the reiser tools on
> > an embedded system that will never show any such output?
> 
> I'm sure all the FSF/Debian folks would be thrilled if someone changed the
> code in [x]emacs to not output anything about the GPL at startup, or if vim
> didn't include any info about helping Ugandan orphans.

First of all emacs is pure bloat so who cares what it does... Vim has
one line about Ugandan orphans at startup, until now I didn't even
notice it was there. If had been pages of crap like what is spewed from
mkfs.reiserfs it would have probably been removed as well, unless it
was against Vim's license, which happens not to be GPL. As far as I can
tell if it annoyed someone enough it is legal under Vim's license to 
remove the Uganda message as well, they only require the license text
itself to remain with the application.  A GPLv3 allowing spamware would
be very annoying, I hope it doesn't happen. If anything this stupid
reiserfs spamware should be spewed before the program runs, not after,
so that the user can see what actually occured without having to scroll
back up, which depending on their console type might be difficult.

Chris
