From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfsprogs: lib/misc.c: why die() aborts?
Date: Mon, 22 Mar 2004 16:57:29 +0300
Message-ID: <405EF0C9.5070105@namesys.com>
References: <20040320161819.GA6734@raptus.homelinux.org>	 <1079959787.1977.24.camel@tribesman.namesys.com>	 <1079961967.11055.414.camel@watt.suse.com> <1079963107.1976.26.camel@tribesman.namesys.com>
Reply-To: reiser@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17378-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079963107.1976.26.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Chris Mason <mason@suse.com>, Domenico Andreoli <cavok@tiscali.it>, reiserfs-list@namesys.com

Vladimir Saveliev wrote:

>Hello
>
>On Mon, 2004-03-22 at 16:26, Chris Mason wrote:
>  
>
>>On Mon, 2004-03-22 at 07:49, Vladimir Saveliev wrote:
>>    
>>
>>>Hi
>>>
>>>On Sat, 2004-03-20 at 19:18, Domenico Andreoli wrote:
>>>      
>>>
>>>>hi all,
>>>>
>>>>in trying to figure out what is the unpack program in reiserfsprogs
>>>>and if it supposed to be distributed in the debian package,
>>>>        
>>>>
>>>No, it should not be distributed
>>>
>>>      
>>>
>>Hmmm, I disagree.  Normal users can use debugreiserfs -p and unpack to
>>do test rebuilds on copies of broken filesystems when they are
>>rebuilding critical data.
>>
>>    
>>
>
>Ok, but then we should rename it to better name. reiserfs_unpack, for
>example
>  
>
or reiserfs_unpack_metadata_bundle

>  
>
>>-chris
>>
>>
>>
>>    
>>
>
>
>
>  
>


-- 
Hans

