From: Jeffrey Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 05/05] reiserfs: use reiserfs_error()
Date: Fri, 16 Jun 2006 01:18:44 -0400
Message-ID: <44923F34.4070202@suse.com>
References: <20060616041901.GA5420@locomotive.unixthugs.org> <44923B38.4030802@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28797-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44923B38.4030802@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser wrote:
> Jeff Mahoney wrote:
>> +			reiserfs_error(s, "vs-4020", "bitmap block "
>> +			               "%lu(%u) can't be freed or reused",
>> +			               block, SB_BMAP_NR(s));
>> 			return 0;
>> 		}
>>
>> 	get_bit_address(s, block, &i, &j);
>>
>> 	if (i >= SB_BMAP_NR(s)) {
>> -		reiserfs_warning(s, "vs-4030", "there is no so many "
>>  
>>
> Jeff, as a native english speaker, can you review the english and
> informativeness of these?
> 
>> -		                 "bitmap blocks: block=%lu, bitmap_nr=%d",
>> -				 block, i);
>> +		reiserfs_error(s, "vs-4030", "there is no so many "
>> +		               "bitmap blocks: block=%lu, bitmap_nr=%d",
>> +		               block, i);
>> 		return 0;
>> 	}

At some point, sure, but I'd rather it be a separate patch. This one is 
just focused on the warning/panic->error conversion. At some point a 
reiserfs-proper-english.diff might not be a bad idea.

-Jeff

--
Jeff Mahoney
SUSE Labs
