From: Ben Collins <bcollins@debian.org>
Subject: Re: plagiarism of reiserfs by Debian
Date: Sat, 19 Apr 2003 16:55:55 -0400
Message-ID: <20030419205555.GY2528@phunnypharm.org>
References: <143CBAC4-7291-11D7-ADF3-00050285B655@ncpro.com> <3EA19DEC.3090202@techhouse.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13724-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EA19DEC.3090202@techhouse.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Travis Crump <pretzalz@techhouse.org>
Cc: Marcel Weber <mmweber@ncpro.com>, Hans Reiser <reiser@namesys.com>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, debian-testing@lists.debian.org, Ed Boraas <ed@debian.org>, debian-devel@lists.debian.org

> all that was removed was *code* that gets compiled.  If the maintainer 
> cannot arbitrarily change any code he wants, then it is not clear that 
> the program is DFSG-free.

Amen. Making part of the code immutable is not what I call free
software. What if I want to use parts of the code and I respect the
copyright and license...does that mean I also have to take this part of
the code and output the credits? What if environment doesn't provide a
way to output the credits. What if I am implementing the reiser tools on
an embedded system that will never show any such output?

What about programs that execute the reiserfs tools (like bootup
scripts)...are they not allowed to redirect or filter this output?

If any of this is questionable, then I suspect reiserfs tools isn't DFSG
compliant and belongs in non-free with all it's flakiness.

-- 
Debian     - http://www.debian.org/
Linux 1394 - http://www.linux1394.org/
Subversion - http://subversion.tigris.org/
Deqo       - http://www.deqo.com/
