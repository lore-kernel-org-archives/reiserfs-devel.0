From: Edward Shishkin <edward@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
Date: Wed, 16 Aug 2006 02:44:22 +0400
Message-ID: <44E24E46.6070106@namesys.com>
References: <BAY19-F195F80B4801CAB6EEB6C46944F0@phx.gbl> <44E24563.1040900@namesys.com> <44E24A54.4010604@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29607-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44E24A54.4010604@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Tom Reinhart <rhino_tom@hotmail.com>, reiserfs-list@namesys.com

David Masover wrote:
> Edward Shishkin wrote:
> 
>> Tom Reinhart wrote:
>>
>>> Anyone with serious need for data integrity already uses RAID, so why 
>>> add brand new complexity for a solved problem?
>>>
>>> RAID is great at recovering data, but not detecting errors.  File 
>>> system can detect errors with checksum.  What is missing is an API 
>>> between layers for filesystem to say "this sector is bad, go rebuild 
>>> it."
>>>
>>
>> Actually we dont need a special API: kernel should warn and recommend
>> running fsck, which scans the whole tree and handles blocks with bad
>> checksums.
> 
> 
> What does this have to do with RAID, though?
> 
> 

I assumed we dont have raid: reiser4 can support its own checksums/ecc
signatures for (meta)data protection via node plugin
