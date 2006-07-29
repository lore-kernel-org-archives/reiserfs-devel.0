From: Sarath Menon <sarathmenon@gmail.com>
Subject: Re: metadata plugins (was Re: the " 'official' point of view"=?iso-8859-15?q?=09expressed_by_kernelnewbies=2Eorg_regarding_reiser4?=
 =?iso-8859-15?q?_inclusion?=)
Date: Sun, 30 Jul 2006 01:32:28 +0530
Message-ID: <200607300132.28326.sarathmenon@gmail.com>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl> <1154164364.2903.10.camel@laptopd505.fenrus.org> <44CBA4BF.80301@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29254-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CBA4BF.80301@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: David Masover <ninja@slaphack.com>

On Saturday 29 July 2006 23:41, David Masover wrote:
> I know Gentoo handles this automatically (emerge  nvidia-kernel).

I hate to say this again, but its not automatically. It requires more 
knowledge of ther user, and is more than asking users to patch the kernel. (I 
am in the support industry and I know of solaris admins, who have used that 
os for more than ten years ask me what the command patch does and what its 
impact is to production systems :-) )

>I use an old-style initrd on this box, because my root FS is
> on an nvidia RAID, so I have to run a program called "dmraid" before I
> mount my root FS -- it's really trivial for me to have Reiser4 as a
> module, and I do, despite it being a root FS.

As a fact I have it as a root FS (and that too reiser4, and as a module). 
Surprisingly, this is a wiki article too in http://gentoo-wiki.com, by 
someone who's more patient enought to write one :-)

> I suspect that, all technical, political, and "mine is bigger" arguments
> aside, being available as a root FS of a distro, especially a default
> FS, would go a long way towards inclusion in the kernel.  So all you
> have to do is find a reasonably popular and friendly distro, with people
> who are (for the moment) easier to deal with than kernel people.

Its actually a matter of a hastle for the end user. That's where I would agree 
with Hans' comments quite earlier.

> Most people, if they even know what a filesystem or a kernel is, still
> won't bother compiling their own kernel, you're right.  But that means
> they are more likely to be using a distro-patched kernel than a stock,
> vanilla one.

Well, that's different, and that's the main problem in the linux empowerment 
that we see around ourselves. It finally revolves around the user, and as 
harsh as it may seem, it ultimately is the user who decides which fs is 
better (Give or take, they don't know the difference between a kernel or 
user-space. or for that matter far more basic things.)

> Of course, it's odd that I mention Gentoo, the Gentoo people (as a rule)
> hate ReiserFS, but there are far more distros than there are popular
> kernel forks.  I'm sure someone will be interested.

I do, and that's partly due to the speed of /usr/portage on reiser4, and the 
easiness of blowing everything and starting from scratch : -)

Cheers,
Sarath
-- 
The gentlemen looked one another over with microscopic carelessness.
