From: Cami <camis@mweb.co.za>
Subject: Re: reiserfs v3 patches updated
Date: Tue, 06 Apr 2004 22:51:56 +0200
Message-ID: <4073186C.3010601@mweb.co.za>
References: <1081210239.4994.69.camel@watt.suse.com> <200404061838.05099.christian.mayrhuber@gmx.net> <4072F6F1.3090806@mweb.co.za> <1081277245.30813.81.camel@watt.suse.com> <4073022E.3090100@mweb.co.za> <1081279465.30829.128.camel@watt.suse.com> <40730ABD.3070507@mweb.co.za> <1081283607.30811.206.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17765-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081283607.30811.206.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

>>>>The majority of the rest of the machines iowait hover around the 1%
>>>>mark.. CPU time tends to be about the same, just the iowait is much
>>>>much higher..
>>>
>>>Very interesting.  data=ordered makes fsync more expensive, since it
>>>ends up syncing more then just the buffers for that one file.  Could you
>>>please try removing data=ordered from machine1?
>>
>>Ok.. after leaving it for a few minutes..
> 
> 
> I'm a little slow today.  data=ordered is the default with these
> patches.  You need to mount -o data=writeback.

data=writeback yields pretty much the same iowait results..
(machine 1+2 are around 5%->8% whereas machine 3->8 are at around 0.8%)

Cami

