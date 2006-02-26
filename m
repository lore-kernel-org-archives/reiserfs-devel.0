From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 default in Underground Dekstop distribution
Date: Sun, 26 Feb 2006 09:34:06 -0800
Message-ID: <4401E68E.8060205@namesys.com>
References: <200602251203.09958.Peter.Foldiak@st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28139-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200602251203.09958.Peter.Foldiak@st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: reiserfs-list@namesys.com

There are so little details that it is hard to know what the problem
they had was.  It does sound though like we need to smooth out the
commits.  We have deferred that for a while.  I know how we should do
it, we just need to do it.  Sigh, there are so many things like
that.....  Probably fsync should be optimized first....

Hans

Peter Foldiak wrote:

>The preview of the April (!?!) 2006 issue of Linux Magazine has an article
>http://www.linux-magazine.com/issue/65/Super_Underground_Desktop.pdf
>saying that Reiser4 is the root filesystem for the distribution "Underground 
>Desktop"
>http://www.ludos.org/
>but says "it failed to live up to the expectations we had for Reiser4", 
>blaming Reiser4 for some performance problems. Not much detail is given.
>
>It also says that "Grub does not support Reiser4", so LILO is used. (Is that 
>true?)
>
>Do you know of any other distributions that comes with Reiser4 by default root 
>file system?
>
> Peter
>
>
>
>  
>

