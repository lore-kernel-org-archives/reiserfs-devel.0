From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 6 Jan 2005 16:56:41 +0000
Message-ID: <20050106165641.GH18173@ZenIV.linux.org.uk>
References: <20041228221218.GA6412@schmorp.de> <20050106124505.GE5352@backtop.namesys.com> <20050106142706.GE519@schmorp.de> <41DD5FA9.5020800@namesys.com> <1967462673.20050106171323@tnonline.net> <20050106162619.GG18173@ZenIV.linux.org.uk> <1936991699.20050106172939@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23050-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1936991699.20050106172939@tnonline.net>
Sender: <pakrat@ftp.linux.org.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

On Thu, Jan 06, 2005 at 05:29:39PM +0100, Spam wrote:
> 
> > It's a risk assessment.  What are the odds of your normal data sets
> > hitting the bug or of someone with malicious intent introducing
> > a demonstration program vs the performance hit of a filesystem
> > without the problem.
> 
>   How can I assess the risk, if I do not know how to produce the bugs?
>   You say certain conditions. But from what I read earlier in the
>   thread, a directory with a fonts in them.....?

Since the concepts of simulators, hash function analysis, and dataset
modelling seem to escape you, perhaps you need to go for the black
and white "Is any risk acceptable," given anecdotal data of one
unexpected failing condition and one script that can regularly create
the failing condition.
> 
> > All filesystems will fail or suffer degraded performance under
> > certain conditions, you need to determine what conditions are acceptable
> > for your data.
> 
>   Slow can be acceptable. But failing? No, a filesystem should not
>   fail.

It should not fail 
1) When media fails
2) When transport hardware is not compliant with specs (permanently on
write caching anyone?)
3) Media has a limited lifetime
...

One thing I don't think I ever saw in this thread was
1) How old was the drive that saw the problem.
2) What was the drive lifetime used to calculate it's MTBF.
-- 
Chris Dukes
Warning: Do not use the reflow toaster oven to prepare foods after
it has been used for solder paste reflow. 
http://www.stencilsunlimited.com/stencil_article_page5.htm
