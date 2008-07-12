From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Nightly Builds
Date: Sat, 12 Jul 2008 03:10:10 -0400
Message-ID: <84BA00E0-5BA8-41A3-9C7C-54723058D7F6@suse.com>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us> <485C0BA9.5090902@suse.com> <28097.202.168.22.19.1214146293.squirrel@webmail.velocity.net.au> <485E788A.8020802@suse.com> <15568.202.168.22.19.1214194598.squirrel@webmail.velocity.net.au> <485FAF96.40608@suse.com> <27533.202.168.22.19.1214318654.squirrel@webmail.velocity.net.au> <48610B80.3020908@suse.com> <15208.202.168.22.19.1214398774.squirrel@webmail.velocity.net.au> <48626E1B.6070604@suse.com> <23129.202.168.22.19.1214638448.squirrel@webmail.velocity.net.au> <4866575D.1000305@suse.com> <14971.202.168.22.19.1214748124.squirrel@webmail.velocity.net.au> <4867DC31.2030702@suse.com> <23784.202.168.22.19.1214826598.squirrel@webmail.velocity.net.au> <4868F3C8.2090006@suse.com> <20253.202.168.22.19.1215615647.squirrel@webma
 il.velocity.net.au> <4874D51A.7020909@suse.com> <24383.202.168.22.19.1215703298.squirrel@webmail.velocity.net.au> <4876301A.6020208@suse.com> <27342.202.168.22.19.1215840119.squirrel@webmail
 .velocity.net.au>
Mime-Version: 1.0 (iPhone Mail 5A347)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <27342.202.168.22.19.1215840119.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: "doiggl@velocitynet.com.au" <doiggl@velocitynet.com.au>
Cc: "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>

Ok... But does the mount fail?

--
Jeff Mahoney (mobile)
SuSE Labs

On Jul 12, 2008, at 1:21 AM, doiggl@velocitynet.com.au wrote:

> Hello,
>
> Im just trying to verify the reiser4 module exists
> # modprobe -v  reiser4
> (returns nothing at the prompt)
>
> A file listing shows:
> # ll /lib/modules/2.6.25.9-1-default/updates
> total 677
> -rw-r--r-- 1 root root 691602 Jul  3 07:08 reiser4.ko
>
> #uname -a
> # uname -a
> Linux orac 2.6.25.9-0.2-default #1 SMP 2008-06-28 00:00:07 +0200  
> x86_64
> x86_64 x86_64 GNU/Linux
>
> Question: I am puzzled because 'modprobe -v  reiser4' returns  
> nothing at
> the prompt, but file /lib/modules/2.6.25.9-1-default/updates/ 
> reiser4.ko
> exists.
>
>>> - How do I verify the reiser4 module is ready for use ?
>> - Jeff wrote
>> # modprobe reiser4
>
> Glenn
>
