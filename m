From: Hans Reiser <reiser@namesys.com>
Subject: Re: Errors requiring --rebuild-tree in 2.4.23
Date: Sun, 14 Dec 2003 15:05:17 +0300
Message-ID: <3FDC51FD.6080809@namesys.com>
References: <br9soe$h0h$1@sea.gmane.org> <1071152521.11147.88.camel@tiny.suse.com> <bra6s2$9ug$1@sea.gmane.org> <3FD8C398.6040903@namesys.com> <brfiql$orq$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16344-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <brfiql$orq$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jens Benecke <jens@spamfreemail.de>
Cc: reiserfs-list@namesys.com, mason <mason@namesys.com>

Jens Benecke wrote:

>Hans Reiser wrote:
>
>  
>
>>errors like this are not due to a lack of data-logging.
>>
>>Dec  1 06:26:05 artus kernel: is_leaf: item location seems wrong (second
>>one): *3.6* [113366 113466 0x1 DIRECT], item_len 280, item_location 1216,
>>free_space(entry_count) 65535
>>    
>>
>
>Hello Hans,
>
>can you imagine a hardware failure causing these errors that does not show
>up in the logs? Usually IDE disk failures are accompanied with IDE layer
>errors, unless the disk is totally down (which it isn't in this case).
>
>
>
>  
>
In theory it could be bad memory or bad CPU.  Software bug seems far 
more likely.  I will let Chris try to debug this, if he fails to get to 
the bottom of it, let me know.

-- 
Hans


