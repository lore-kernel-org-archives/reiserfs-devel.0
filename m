From: Cami <camis@mweb.co.za>
Subject: Re: --rebuild-tree
Date: Tue, 06 Jul 2004 11:20:21 +0200
Message-ID: <40EA6ED5.8070003@mweb.co.za>
References: <200407060828.56801.aotto1968@onlinehome.de> <40EA5193.2040604@mweb.co.za> <40EA6932.7090606@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19526-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40EA6932.7090606@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi Vladimir

>> Can anyone tell me roughly how dangerous this is
> 
> it is not dangerous. Just, please, make sure you have recent reiserfsck.

Yea.. I updated to the latest version last night..

>> and roughly how long something like this will take?
> 
> hard to say. It depends on hardware. Given that 35 gb is not too much 

Its a big ass Dell storage device (CX600) with fibre
drives so its quite a monster / quite fast..

> reiserfsck --rebuild-tree should not take too much. 2 hours? Vitaly may 
> want to correct me, though

mm.. thats not too bad at all..

>> The filesystem stores all the users mailboxes in
>> maildir format so there are millions of files..
>>
>> Any tips/comments would be appreciated..
> 
> PS: please do not forget that backuping is important when dealing with 
> user mailboxes even if you are running super reliable hardward and 
> bugless software.

Busy making a snapshot of the filesystem now..

Thanks!
Cami
