From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Tue, 18 Feb 2003 22:28:47 +0300
Message-ID: <3E52896F.4050302@namesys.com>
References: <3E4C392A.2070909@namesys.com> <20030214111829.A21849@namesys.com> <20030214031316.L22930@schatzie.adilger.int> <20030214131746.H10351@namesys.com> <20030214035034.M22930@schatzie.adilger.int> <3E4CF04A.2030904@namesys.com> <20030214120630.O22930@schatzie.adilger.int> <3E4D4129.8040103@namesys.com> <20030215153710.A1723@schatzie.adilger.int> <3E5279C2.3090702@namesys.com> <20030218222239.A20899@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030218222239.A20899@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Andreas Dilger <adilger@clusterfs.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Tue, Feb 18, 2003 at 09:21:54PM +0300, Hans Reiser wrote:
>
>  
>
>>>By all means, don't do checks for an hour, or allow users to set the 
>>>maximum
>>>boot check duration in the superblock.  I'm sure users don't mind waiting
>>>5s at boot time if it means they don't lose data.
>>>      
>>>
>>I doubt that there is a lot we can check in 5 seconds on a filesystem 
>>with lots of small files, but I could be wrong.
>>    
>>
>
>We discussed this with Vitaly today.
>We can do some simply things and if some of these show wrong signs,
>we can do a warning and sysadmin can schedule a downtime for
>fsck.
>Simple things are: read the bitmaps and compare used block counts with
>what stored in superblock.
>Check consistency of tree root (we have a pointer there in superblock,
>also it's supposed level).
>May be something else that is that simple.
>
>Bye,
>    Oleg
>
>
>  
>
Ok.

-- 
Hans


