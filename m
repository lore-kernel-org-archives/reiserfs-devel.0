From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 6 Jan 2005 16:26:19 +0000
Message-ID: <20050106162619.GG18173@ZenIV.linux.org.uk>
References: <20041228221218.GA6412@schmorp.de> <20050106124505.GE5352@backtop.namesys.com> <20050106142706.GE519@schmorp.de> <41DD5FA9.5020800@namesys.com> <1967462673.20050106171323@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23048-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1967462673.20050106171323@tnonline.net>
Sender: <pakrat@ftp.linux.org.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

On Thu, Jan 06, 2005 at 05:13:23PM +0100, Spam wrote:
> >>>>generic bug in handling hash collisions?
> >>>>      
> >>>>
> >>>Tea hash is designed to be more resistant.  
> >>>    
> >>>
> >>
> >>As the example posted shows, tea doesn't look better, it generates
> >>nicely-looking collisions, too.
> >>  
> >>
> > You mean, in practice you hit them, or with an artificially generated
> > set of filenames intended to cause collisions you get those collisions?
> 
>  Excuse me, but do you mean that there are undocumented limits on what
>  files can be named to, and how many files with similar or random
>  names in a ReiferFS volume?

No, I'd say it's pretty well documented that reiserfs fails under
certain hash collision conditions instead of continueing to work
(albeit more slowly).

The nature of the hash collisions must be pretty obvious if a shell
script can be written to demonstrate the problem.
> 
>  This sounds bad...

It's a risk assessment.  What are the odds of your normal data sets
hitting the bug or of someone with malicious intent introducing
a demonstration program vs the performance hit of a filesystem
without the problem.

All filesystems will fail or suffer degraded performance under
certain conditions, you need to determine what conditions are acceptable
for your data.

-- 
Chris Dukes
Warning: Do not use the reflow toaster oven to prepare foods after
it has been used for solder paste reflow. 
http://www.stencilsunlimited.com/stencil_article_page5.htm
