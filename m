From: Matthew Palmer <mpalmer@hezmatt.org>
Subject: Re: Debian: reiser4 non-DFSG-free. !?!
Date: Fri, 7 May 2004 09:32:39 +1000
Message-ID: <20040506233239.GB25081@hezmatt.org>
References: <kkKLVD.A.2NF.qPomAB@murphy> <409A90A5.30600@almg.gov.br> <409A914D.1020301@namesys.com>
Mime-Version: 1.0
Return-path: <bounce-debian-legal=debian-legal=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <409A914D.1020301@namesys.com>
Resent-Message-ID: <uu_54.A.-iB.TtsmAB@murphy>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Post: <mailto:debian-legal@lists.debian.org>
List-Help: <mailto:debian-legal-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-legal-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-legal-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-legal/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: debian-legal@lists.debian.org, reiserfs-list@namesys.com

On Thu, May 06, 2004 at 12:26:05PM -0700, Hans Reiser wrote:
> Another example:
> 
> reiser@linux:~/reiser4progs-0.5.3> /sbin/mkreiserfs -V
> mkreiserfs 3.6.9 (2003 www.namesys.com)
> 
> A pair of credits:
> Edward Shushkin wrote the encryption and compression  file plugins,  and 
> the V3
> journal relocation code.
> 
> Vladimir Demidov wrote the parser for sys_reiser4(), the V3 alpha port, 
> part of
> the V3  journal  relocation code,  and helped  Hans keep  the business  
> side of
> things running.

I note that you appear to have put a random selection of credits in the
output on each invocation (at least, two invocations on 3.6.13 give me
different credits).  This makes the definition of what "credits" are, and
"giving equal prominence" to all of them even harder.  As a contributor, if
I care that much about getting my name "in lights", and part of the
mandatory output of a program, the chances are I don't want to possibly miss
that chance on a lot of eyeballs and place myself subject to the vagaries of
a random number generator.

Of course, in this case I would imagine that all of your contributors have
said it's OK, but would you consider this modification OK if you hadn't made
it?  It certainly would be failing the letter of "equal prominence to all",
but you've done it yourself?  A basic tenet of software freedom (IMO) is
that modifications should be OK no matter who does them -- this allows
everyone the power to fork if they so choose.

Oh dear, I appear to have become embroiled in a long thread...

- Matt

