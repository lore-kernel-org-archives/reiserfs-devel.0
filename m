From: Cami <camis@mweb.co.za>
Subject: Re: reiserfs v3 patches updated
Date: Tue, 06 Apr 2004 22:38:16 +0200
Message-ID: <40731538.8030302@mweb.co.za>
References: <1081210239.4994.69.camel@watt.suse.com> <200404061838.05099.christian.mayrhuber@gmx.net> <4072F6F1.3090806@mweb.co.za> <1081277245.30813.81.camel@watt.suse.com> <4073022E.3090100@mweb.co.za> <1081279465.30829.128.camel@watt.suse.com> <40730ABD.3070507@mweb.co.za> <1081283340.30828.198.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17764-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081283340.30828.198.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

>>What i then tried on machine1 was remounting it noatime,nodiratime and
>>what was wierd was that the iowait stayed exactly the same, no indication
>>of dropping at all.. Does the kernel patches change any of the default
>>mount options at all? If i put the stock 2.6.5 kernel back on without
>>the patch applied and mount it back as noatime,nodiratime, the iowait
>>drops back to its normal 1%..
> 
> Do you have any numbers for the amount of mail delivered per second on
> each box? 

Currently, each machine is doing about 10 mails per second.

Puring peak hours this figure can increase to the 20's and 30's
and about 1500 concurrent connections each (at around
20mbit/s of incoming mail)..

> I've got an idea that should help lower the io wait
> percentage as well, trying a few things here.

I'll be looking forward to that..

Cami
