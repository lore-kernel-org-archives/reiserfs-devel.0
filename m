From: Hubert Mantel <mantel@suse.de>
Subject: Re: when distros do not support official Marcelo kernels they are not being team players (was Re: reiserfs on redhat advanced server?)
Date: Wed, 5 Feb 2003 09:34:03 +0100
Message-ID: <20030205083402.GA11363@suse.de>
References: <86lm0xpmho.fsf@trasno.mitica> <3E3E7A95.1050908@namesys.com> <1044284001.15685.358.camel@tiny.suse.com> <3E3EBA3F.7060806@namesys.com> <1044300746.15684.428.camel@tiny.suse.com> <3E3EC7EC.8090005@namesys.com> <1044304857.15684.475.camel@tiny.suse.com> <3E3F0D5D.5070409@namesys.com> <20030204163609.GT19723@suse.de> <3E403488.9050408@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12651-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E403488.9050408@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi Hans,

On Wed, Feb 05, Hans Reiser wrote:

> >>A Marcelo kernel is NOT a randomly patched kernel.  It is the OFFICIAL 
> >>kernel that the community has picked to be the official kernel.  SuSE 
> >>and RedHat should be team players, and act accordingly. 
> >
> >SuSE and Red Hat cannot use the official kernel, because it falls apart in 
> >certain scenarios and is lacking lots of features and drivers.
> >
> >All the needed fixes and features are available. I would be happy if all 
> >this stuff would be in the official kernel, so I would not need to 
> >maintain several hundreds of patches.
> >
> Has Namesys just been lucky in regards to how responsive Marcelo has 
> been for us?  In my interactions with him, he has never once 
> unreasonably rejected a patch or ignored a patch.

Every time an official kernel is released, I can see postings to this list 
asking for new versions of various patches (data-logging, quota for 
reiserfs and so on). So apparently there are users who cannot use the 
vanilla kernel but need a patched one. So this is not really different 
from the situation distributors are in.

This does not imply that Marcelo is doing a bad job. The opposite is true. 
There might be good reasons not to include every new feature into the 
official kernel (if it is only because there are more urgent things that 
get higher priority).

And the distributors really do help the development of the kernel and thus 
the whole community. Take for example the highmem-I/O feature: This is 
something that is strictly needed when you want to run Linux on some 
larger machines. We have been shipping it for about two years now and 
finally it was included in 2.4.20. I assume the fact that it has been in 
use by distributions for quite some time was proof enough that this 
feature is needed and stable, so finally it got in. I'm not sure if this 
had happened if it hadn't been used in distributions before.

Btw, same happened with reiserfs itself. If SuSE had always shipped the 
official kernel, reiserfs probably hadn't made its way into 2.4. So you 
are yourself profiting from distributors shipping patched kernels ;)

And things move on. For example we need the pte-highmem feature. In the 
official kernel ptes cannot live in highmem, which means that Oracle is 
unusable on bigger machines. On a box with way 32 GB of RAM, Oracle simply 
will run out of memory (in reality it "only" runs out of ptes, but the 
result is the same).

There are lots of similar examples.

[...]

> The ability to download the latest official stable kernel is one of the 
> great things about Linux.  There are times when the latest official 
> kernel is behind SuSE or RedHat, and there are times when it is ahead, 
> as a result of different release schedules if nothing else.

Users are always able to download the official kernel. And they are free 
to use it. The question is whether a distributor can officially support 
those kernels. Problem is that nobody is willing to pay the price for this 
service. It _IS_ expensive. As Chris pointed out, this is a great 
opportunity for independent Linux gurus who can sell this kind of service 
to people who are willing to pay for it.

But distributors really need to restrict official support to the kernel 
they ship. I'm in this business for about 10 years now and have seen so 
many cases where people have screwed their system by just recompiling the 
kernel and forgetting some important config option. This simply cannot be 
supported by the price of a CD box.

All this does not make the official kernel useless. It is a great 
reference kernel and THE major synchronisation point. It is very valuable 
for distributors to get a report of the form "I have a problem with your 
distro kernel, but the official kernel works fine", because this restricts 
the source of the problem and makes it easier to fix. And when we update 
our kernel to some new official version, every time lots of patches become 
obsolete, which is great. I'm not really eager to maintain hundreds of 
patches. If we would be able to just use the official kernel, I would be a 
very happy guy.

> It seems that what RedHat puts on its Advanced Server CD is a kernel no 
> reiserfs user would want to use if he had a choice.  What SuSE has put 

Yes, but Red Hat always has made it very clear that they are not a big 
supporter of reiserfs and prefer ext3 instead. It's their default 
filesystem and chances are high that ext3 in RH is better than in the 
standard kernel. If people really care about support they should use what 
the distributor recommends and supports.

You should realize that you (and probably most of the people on this list) 
are not representative for the people just using Linux to get their work 
done. For those people support is some kind of insurance. They are willing 
to pay money just in order to be sure somebody will solve their problems 
when they arise. They will just use what they think is best supported, so 
they should (and most of them will) use ext3 when deploying RHAS.

The sysadmin of some big bank NEVER will use some "inofficial" kernel, 
because his boss will kill him as soon as something breakes. He will not 
even use something different than the default filesystem of the product, 
because he wants to be safe. He gets paid for this.

> on its CD is at the moment probably a faster and more stable for 
> reiserfs kernel than the official kernel (I hope we will change that 
> soon, but....).  ReiserFS is just one kernel feature, and what is best 
> for users is going to vary all over the place.  Sometimes the distro 
> kernel is more advanced for some feature, sometimes the official kernel 
> is more advanced.
> 
> If we as a community fragment for the purpose of experimenting, then it 
> is healthy.  However, there needs to be one kernel branch that the 
> entire community backs up and says "we stand behind this except when we 
> are motivated by its specific flaws for the particular user in question 
> to not do so". 

This is exactly what's happening. The official kernel is the one that 
mandates the release number. It is the major synchronization point every 
distributor bases its kernel on. And the official kernel benefits from the 
work the distributors are doing.

> Maintainers need to be able to send their patches to Marcelo, and know 
> that now they can tell any Linux user of any distro to just upgrade to 
> the latest official stable kernel and case closed.

An user who has spent lots of money for his IT infrastructure WANTS an 
official kernel from the distributor. If a bug is present in the distro 
kernel but not in the official one, they will not use the official kernel, 
but demand that the fix goes into the distro kernel.

> Consider my situation with the user of the RedHat 2.4.9 based kernel, 
> because it has the advantage of not being a SuSE related problem.;-)
> 
> ReiserFS users should not use a 2.4.9 based kernel, they should use 
> 2.4.18 or later.  It is wrong that RedHat won't support him if he 
> upgrades to the official kernel.  In this case, the official kernel is 
> more advanced for his needs.  It removes one of the great advantages of 
> the open source methodology compared to proprietary OSes if he can't 
> download kernels from the net.  What should I say to him (other than 
> switch his whole distro to SuSE;-) )?

There is nothing other that you can say. If the user wants RHAS and wants
the support (hey, he is paying quite some money for it), he really should
use what the distributor recommends, tests and certifies, which is ext3 in
the case of RHAS.

> The official kernel is our kernel community's only chance to overcome 
> its fragmentation.  We need to support it.  All of us, regardless of 
> what camp we are in.   It should never be the discouraged officially 
> unsupported branch of the kernel (except when specific flaws relevant to 
> the usage of the user in question are present, and even then it should 
> be with an attitude of "the patch you need isn't yet in the official 
> kernel, try the distro kernel and things will work").
> 
> Let's all work as a team.

I think this is the case. And it works pretty well.

> Hans
                                                                  -o)
    Hubert Mantel              Goodbye, dots...                   /\\
                                                                 _\_v
