From: "Tom Reinhart" <rhino_tom@hotmail.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
Date: Tue, 15 Aug 2006 14:27:33 -0700
Message-ID: <BAY19-F195F80B4801CAB6EEB6C46944F0@phx.gbl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29600-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Anyone with serious need for data integrity already uses RAID, so why add 
brand new complexity for a solved problem?

RAID is great at recovering data, but not detecting errors.  File system can 
detect errors with checksum.  What is missing is an API between layers for 
filesystem to say "this sector is bad, go rebuild it."

This seems like a much more simple and useful thing than adding ECC into the 
filesystem itself.


>>>How about we switch to ecc, which would help with bit rot not sector
>>>loss?
>>
>>
>>Interesting aspect.
>>
>>Yes, we can implement ECC as a special crypto transform that inflates
>>data. As I mentioned earlier, it is possible via translation of key
>>offsets with scale factor > 1.
>>
>>Of course, it is better then nothing, but anyway meta-data remains
>>ecc-unprotected, and, hence, robustness is not increased..
>>

_________________________________________________________________
On the road to retirement? Check out MSN Life Events for advice on how to 
get there! http://lifeevents.msn.com/category.aspx?cid=Retirement

