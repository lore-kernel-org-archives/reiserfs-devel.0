From: Hans Reiser <reiser@namesys.com>
Subject: Re: when distros do not support official Marcelo kernels they are
 not being team players (was Re: reiserfs on redhat advanced server?)
Date: Wed, 05 Feb 2003 00:45:44 +0300
Message-ID: <3E403488.9050408@namesys.com>
References: <20030131122147.GE15359@marowsky-bree.de> <3E3A6D76.7080300@namesys.com> <86lm0xpmho.fsf@trasno.mitica> <3E3E7A95.1050908@namesys.com> <1044284001.15685.358.camel@tiny.suse.com> <3E3EBA3F.7060806@namesys.com> <1044300746.15684.428.camel@tiny.suse.com> <3E3EC7EC.8090005@namesys.com> <1044304857.15684.475.camel@tiny.suse.com> <3E3F0D5D.5070409@namesys.com> <20030204163609.GT19723@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12645-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030204163609.GT19723@suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hubert Mantel <mantel@suse.de>
Cc: =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com

Hubert Mantel wrote:

>Hi,
>
>On Tue, Feb 04, Hans Reiser wrote:
>
>  
>
>>A Marcelo kernel is NOT a randomly patched kernel.  It is the OFFICIAL 
>>kernel that the community has picked to be the official kernel.  SuSE 
>>and RedHat should be team players, and act accordingly. 
>>    
>>
>
>SuSE and Red Hat cannot use the official kernel, because it falls apart in 
>certain scenarios and is lacking lots of features and drivers.
>
>All the needed fixes and features are available. I would be happy if all 
>this stuff would be in the official kernel, so I would not need to 
>maintain several hundreds of patches.
>
Has Namesys just been lucky in regards to how responsive Marcelo has 
been for us?  In my interactions with him, he has never once 
unreasonably rejected a patch or ignored a patch.

>
>  
>
>>Linebackers should defend the quarterback, or convince the rest of the 
>>team to get a different quarterback.
>>    
>>
>
>Sorry, I don't understand a single word in this sentence.
>
Sorry about the american football reference (quarterbacks are the team 
strategists and the players who most often have the ball, linebackers 
are guys who among other things keep him from being tackled (being 
tackled while you have the ball is bad)). 

The ability to download the latest official stable kernel is one of the 
great things about Linux.  There are times when the latest official 
kernel is behind SuSE or RedHat, and there are times when it is ahead, 
as a result of different release schedules if nothing else.

It seems that what RedHat puts on its Advanced Server CD is a kernel no 
reiserfs user would want to use if he had a choice.  What SuSE has put 
on its CD is at the moment probably a faster and more stable for 
reiserfs kernel than the official kernel (I hope we will change that 
soon, but....).  ReiserFS is just one kernel feature, and what is best 
for users is going to vary all over the place.  Sometimes the distro 
kernel is more advanced for some feature, sometimes the official kernel 
is more advanced.

If we as a community fragment for the purpose of experimenting, then it 
is healthy.  However, there needs to be one kernel branch that the 
entire community backs up and says "we stand behind this except when we 
are motivated by its specific flaws for the particular user in question 
to not do so". 

Maintainers need to be able to send their patches to Marcelo, and know 
that now they can tell any Linux user of any distro to just upgrade to 
the latest official stable kernel and case closed.

Consider my situation with the user of the RedHat 2.4.9 based kernel, 
because it has the advantage of not being a SuSE related problem.;-)

ReiserFS users should not use a 2.4.9 based kernel, they should use 
2.4.18 or later.  It is wrong that RedHat won't support him if he 
upgrades to the official kernel.  In this case, the official kernel is 
more advanced for his needs.  It removes one of the great advantages of 
the open source methodology compared to proprietary OSes if he can't 
download kernels from the net.  What should I say to him (other than 
switch his whole distro to SuSE;-) )?

The official kernel is our kernel community's only chance to overcome 
its fragmentation.  We need to support it.  All of us, regardless of 
what camp we are in.   It should never be the discouraged officially 
unsupported branch of the kernel (except when specific flaws relevant to 
the usage of the user in question are present, and even then it should 
be with an attitude of "the patch you need isn't yet in the official 
kernel, try the distro kernel and things will work").

Let's all work as a team.

-- 
Hans


