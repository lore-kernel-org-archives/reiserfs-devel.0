From: Hans Reiser <reiser@namesys.com>
Subject: Re: nfs
Date: Sun, 16 Nov 2003 20:08:21 -0800
Message-ID: <3FB849B5.1020404@namesys.com>
References: <1068931388.2186.6.camel@redeeman.linux.dk> <20031115214812.GD25876@hvs.envisage.co.za> <3FB8DD83.4030105@insightbb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16104-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB8DD83.4030105@insightbb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dan Oglesby <d.oglesby@insightbb.com>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Dan Oglesby wrote:

> Hendrik Visage wrote:
>
>> On Sat, Nov 15, 2003 at 10:23:08PM +0100, Redeeman wrote:
>>
>>> i have read that nfs dont work with reiserfs, but even though that, i
>>> made an export, and it works just perfect, is it dangoures somehow?
>>
>>
>>
>> Several moons ago, there were problems with reiserfs and NFS, as
>> reiserfs didn't (still don't?) have the notion of inodes, which is
>> used in NFS for filehandle information. there were a quick work around
>> which didn't work that well, but the current 2.4.x kernels and 
>> Reiserfs 3.6
>> works sofar without troubles.
>>
>>
>> Hendrik
>>
>
> I export several ReiserFS filesystems via NFS, and have had no issues 
> accessing or manipulating data via NFS.  This is with kernel 2.4.21 
> and ReiserFS 3.6.
>
> --Dan
>
>
>
The described problems were more like years ago than moons ago, however, 
there were some kernels a few moons ago that had NFS problems not due to 
reiserfs code just to keep things in a nice state of chaos for the 
users.....

-- 
Hans


