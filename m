From: Hans Reiser <reiser@namesys.com>
Subject: Re: problem with reiser4
Date: Tue, 01 Mar 2005 14:06:31 -0800
Message-ID: <4224E767.5030908@namesys.com>
References: <4224BA6B.7040402@iparadigms.com> <200503012007.53428.kde.sch@ttgen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200503012007.53428.kde.sch@ttgen.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred Schaettgen <kde.sch@ttgen.net>
Cc: reiserfs-list@namesys.com

Fred Schaettgen wrote:

>On Tuesday 01 March 2005 19:54, fitzboy wrote:
>  
>
>>Hello all,
>>I'm just switching from 2.4/reiser3 to 2.6/reiser4 on the first batch of
>>machines. We are running a bunch of apple xRAIDs connected to Dell
>>servers running Debian. we have the 2.6.10-mm kernel and we can make the
>>reiser4 partitions, but there is a lot of lost space somewhere. If I
>>create a reiser3 or xfs partition, I get 1.1T, but with reiser4 I can't
>>get above 984GB. That is too much of a jump to be explained by overhead,
>>so something is wrong... any thoughts?
>>    
>>
>
>I'm not an expert, but isn't the free space just a a rough estimation? 
>
Uh, no.

>You 
>can't know in advance what the average file size will be etc. Maybe reiser4 
>is just more conservative. What matters is how much data is actually stored 
>on the disk the moment it runs full.
>  
>
It is user error or a bug.  He is saying the reported free space is 
less, and this should not be.  Note that it could be a units of 
measurement issue also....

>Fred
>
>  
>

