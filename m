From: David Masover <ninja@slaphack.com>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed
 by kernelnewbies.org regarding reiser4 inclusion)
Date: Sat, 29 Jul 2006 15:30:15 -0500
Message-ID: <44CBC557.4050403@slaphack.com>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl> <1154164364.2903.10.camel@laptopd505.fenrus.org> <44CBA4BF.80301@slaphack.com> <200607300132.28326.sarathmenon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29255-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607300132.28326.sarathmenon@gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sarath Menon <sarathmenon@gmail.com>
Cc: reiserfs-list@namesys.com

Sarath Menon wrote:
> On Saturday 29 July 2006 23:41, David Masover wrote:
>> I know Gentoo handles this automatically (emerge  nvidia-kernel).
> 
> I hate to say this again, but its not automatically. It requires more 

My point is, there's a fairly large group of users who would be willing 
to do that, as they're willing to do that to get their video drivers 
working.  Also, assuming a distro did choose to support it, the only 
reason nvidia-kernel isn't just distributed with a pre-built kernel (on 
pre-built OSes, anyway) is licensing.  This isn't a problem for Reiser4, 
which is GPL'd.

>> I suspect that, all technical, political, and "mine is bigger" arguments
>> aside, being available as a root FS of a distro, especially a default
>> FS, would go a long way towards inclusion in the kernel.  So all you
>> have to do is find a reasonably popular and friendly distro, with people
>> who are (for the moment) easier to deal with than kernel people.
> 
> Its actually a matter of a hastle for the end user. That's where I would agree 
> with Hans' comments quite earlier.

Putting it in the kernel doesn't make it any more or less of a hassle 
for the end-user than getting distro support.  I remember downloading a 
different set of Debian floppies which supported XFS, before XFS was 
mainstream.

In that sense, it's somewhat done already -- there is a Gentoo livecd 
that is kept patched for Reiser4.  The problem with Gentoo, of course, 
is that if you're going to use Gentoo, you're going to be compiling your 
own kernel.  So when it comes down to getting vanilla-sources or 
gentoo-sources, it wouldn't take much -- just a reiser4-sources, or a 
separate reiser4-module package.

>> Most people, if they even know what a filesystem or a kernel is, still
>> won't bother compiling their own kernel, you're right.  But that means
>> they are more likely to be using a distro-patched kernel than a stock,
>> vanilla one.
> 
> Well, that's different, and that's the main problem in the linux empowerment 
> that we see around ourselves. It finally revolves around the user, and as 
> harsh as it may seem, it ultimately is the user who decides which fs is 
> better (Give or take, they don't know the difference between a kernel or 
> user-space. or for that matter far more basic things.)

If I remember right, SuSe had ReiserFS as the default at one point.  If 
even one moderately popular Linux had Reiser4 as the default FS, it 
would get a LOT more exposure than it would simply being included (as 
EXPERIMENTAL, at that) in the vanilla kernel.

>> Of course, it's odd that I mention Gentoo, the Gentoo people (as a rule)
>> hate ReiserFS, but there are far more distros than there are popular
>> kernel forks.  I'm sure someone will be interested.
> 
> I do, and that's partly due to the speed of /usr/portage on reiser4, and the 
> easiness of blowing everything and starting from scratch : -)

Yes, I love /var/lib/portage/world also.

Is /usr/portage still faster on Reiser4?  I know it was when I switched, 
but that was years ago...
