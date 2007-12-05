From: Ric Wheeler <ric@emc.com>
Subject: Re: [PATCH 2/2] reiserfs: Add mount counting
Date: Wed, 05 Dec 2007 13:18:07 -0500
Message-ID: <4756EB5F.5040108@emc.com>
References: <474B4BCF.1000905@suse.com> <47545D0D.6080608@suse.com> <5c7c368b0712031236i33abc7bdtd7a14354c67169b3@mail.gmail.com> <475469B8.4050004@suse.com> <5c7c368b0712031251w75febd3bve5aee70c4935a7c9@mail.gmail.com> <475475E5.1010400@suse.com> <5c7c368b0712031456p120634behc13f2d546df8659b@mail.gmail.com> <47548A90.3060805@suse.com> <475697F3.8050209@emc.com> <4756A124.1020905@sun.com> <4756C48C.60400@suse.com> <4756E5A5.7020903@sun.com>
Reply-To: ric@emc.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4756E5A5.7020903@sun.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@clusterfs.com>
Cc: Jeff Mahoney <jeffm@suse.com>, Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Vladimir Saveliev wrote:
> Hello
> 
> Jeff Mahoney wrote:
> 
>> That's strange. 
> 
> No, 3.6.20 was made by Vitaly, it mostly contains massive cleanups and
> an --rebuild-tree optimization for specific filesystem corruption which
> made reiserfsck to work extremely slow.
> 
> The work I did for EMC was about improving of overal reiserfsck
> performance. I have local cvs repository for that work and put code
> snapshots at ftp://ftp.namesys.com/pub/tmp. So, that work is not
> included into 3.6.20.
> 
> I am sorry that things got messed up that much, please let me know if I
> can help to work out something reasonable.
> 
>> Someone else must've moved it to /pub/reiserfsprogs/
>> then. That's certainly where I got a copy of it. A google for
>> reiserfsprogs 3.6.20, shows several pointers to
>> ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.20.tar.gz too.
>>
> 
> Best regards,
> Vladimir


And of course, we will be happy to try and help with the testing/error 
injection, etc...

It is good work and well worth getting rolled back into the changes,

ric
