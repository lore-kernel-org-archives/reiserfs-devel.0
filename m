From: Hans Reiser <reiser@namesys.com>
Subject: when distros do not support official Marcelo kernels they are not
 being team players (was Re: reiserfs on redhat advanced server?)
Date: Mon, 03 Feb 2003 17:20:05 +0300
Message-ID: <3E3E7A95.1050908@namesys.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org>	<3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>	<3E3A6071.6060102@namesys.com>	<20030131115333.GC15359@marowsky-bree.de>	<3E3A67AE.4050601@namesys.com>	<20030131122147.GE15359@marowsky-bree.de>	<3E3A6D76.7080300@namesys.com> <86lm0xpmho.fsf@trasno.mitica>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12613-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <86lm0xpmho.fsf@trasno.mitica>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Juan Quintela <quintela@mandrakesoft.com>
Cc: Lars Marowsky-Bree <lmb@suse.de>, =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

Juan Quintela wrote:

>>>>>>"hans" == Hans Reiser <reiser@namesys.com> writes:
>>>>>>            
>>>>>>
>
>hans> I understand and support being pissed at Linus for calling it 2.4.0
>hans> when it wasn't stable enough before 2.4.18 because VM and VFS were
>hans> still being changed, but Marcelo is pretty stable in all of his
>hans> official releases, and it is easy to get him to take good code.
>
>But it is not possible to get Marcelo to adapt his release schedule to
>the distro's release schedule :p That is one of the BIG problems.  If
>when your release is about to freeze, marcelo kernel is in pre5/pre6
>what do you do:
>
>- bet that final kernel will be there by the end of the distro release
>  and switch.  And in the proccess, invalidate all the testing that
>  you have done so far.
>
>- get the old known stable kernel, and adapt all the bugfixes that you
>  found in the pre series?
>
This is reasonable, and I am not complaining about it. 

It is different from refusing to support the user who downloads 
Marcelo's kernel after it does ship (after the distro CD went into the 
stamping plant). That is what I am complaining about.  The default 
should be to support all Marcelo kernels unless there is a motivated 
reason not to (e.g. he ships a broken NFS kernel and the user is 
complaining about NFS).  Users should feel that they can download any 
latest official stable kernel (it is okay though to tell them to check a 
website created by the distro to see if it is a known bad/unsupported 
kernel), and everything will be fine with the distro.  When distros 
don't do this, they are not being team players.

>
>What strategy do you think that is better?  If you bet (as almost
>everybody) that second one is better, you are going to have a heavily
>patched kernel.
>
>And that is without taking into account that a lot of the bug fixes
>that go to marcelo kernel go the route:
>
>- user find bug
>- user blame distro kernel
>- distro kernel team found the problem (sometimes with cooperation
>  with the subsystem maintainer)
>
I don't see as many ReiserFS bugs found/fixed by distro kernel teams 
responding to complaints by their users as I would expect.  Perhaps we 
are unusual, I lack the perspective to know.  I would like to see more 
of them, and I don't really understand the lack of them as I would 
expect to see more.

-- 
Hans


