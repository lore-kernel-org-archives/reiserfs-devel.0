From: Nick Burrett <nick@dsvr.net>
Subject: Re: $25 question - ReiserFS 3.6 data errors on 2.4.23
Date: Wed, 18 Feb 2004 13:27:49 +0000
Message-ID: <40336855.1030400@dsvr.net>
References: <20040218093510.GD21098@backtop.namesys.com> <1077098911.5090.38.camel@tribesman.namesys.com> <c0verm$ps6$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16827-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <c0verm$ps6$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jens Benecke <jens@spamfreemail.de>
Cc: reiserfs-list@namesys.com



Jens Benecke wrote:
> Vladimir Saveliev wrote:
>>>Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
>>>one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
>>>free_space(entry_count) 0
>>>Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
>>>format found in block 4683374. Fsck?
>>
>>These days usually when one notices similar corruptions - he later
>>discovers hardware problem (memory problem more often). May I ask you to
>>try memtest for some time.
> 
> 
> We did, we even exchanged memory, it happened again.

This reminds me of a similar problem that we experienced across several 
of our servers.  It turned out that an upgrade from reiserfsprogs 3.6.8 
to 3.6.11 changed the status result codes of 'reiserfsck' meaning that 
our scripts failed to detect that '--check' was reporting that we should 
also run '--fix-fixable'.

Regards,


Nick.


-- 
Nick Burrett, Senior Systems and Network Engineer
Designer Servers Ltd.   http://www.dsvr.co.uk

