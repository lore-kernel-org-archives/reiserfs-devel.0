From: Oleg Drokin <green@namesys.com>
Subject: Re: plagiarism of reiserfs by Debian
Date: Mon, 21 Apr 2003 10:03:15 +0400
Message-ID: <20030421100315.A23789@namesys.com>
References: <143CBAC4-7291-11D7-ADF3-00050285B655@ncpro.com> <3EA19DEC.3090202@techhouse.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13741-reiserfs=m.gmane.org@namesys.com>
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

Hello!

On Sat, Apr 19, 2003 at 03:05:16PM -0400, Travis Crump wrote:
> You mean a bug report like 
> <http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=152547>?  Oh, wait... 
>  What if someone wanted to write a gtk frontend to mkreiserfs?  The 

Last time we spoke with EVMS folks about this kind of stuff, we agreed that they'd open
a pipe to mkreiserfs and then will show the mkreiserfs' output in separate window.
(in fact not only mkreiserfs's output, but output of all tools they run).

Flames to /dev/null.

And there are (were?) another set of tools for making/modifying reiserfs filesystems
(except that there is no fsck) called progsreiserfs. (not being developed anymore, I think, but it
works as is). Use that, if you like it more.

Bye,
    Oleg
