From: Hans Reiser <reiser@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
Date: Tue, 15 Aug 2006 14:55:54 -0700
Message-ID: <44E242EA.2030605@namesys.com>
References: <BAY19-F195F80B4801CAB6EEB6C46944F0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29602-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <BAY19-F195F80B4801CAB6EEB6C46944F0@phx.gbl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Reinhart <rhino_tom@hotmail.com>
Cc: reiserfs-list@namesys.com

Tom Reinhart wrote:
> Anyone with serious need for data integrity already uses RAID, so why
> add brand new complexity for a solved problem?
>
> RAID is great at recovering data, but not detecting errors.  File
> system can detect errors with checksum.  What is missing is an API
> between layers for filesystem to say "this sector is bad, go rebuild it."
I agree that such an API is needed.  I think there are a lot of systems
on desktops that lack RAID though.  Probably I should leave ECC for some
"hopefully next year" future release though.
>
> This seems like a much more simple and useful thing than adding ECC
> into the filesystem itself.
>
>
>>>> How about we switch to ecc, which would help with bit rot not sector
>>>> loss?
>>>
>>>
>>> Interesting aspect.
>>>
>>> Yes, we can implement ECC as a special crypto transform that inflates
>>> data. As I mentioned earlier, it is possible via translation of key
>>> offsets with scale factor > 1.
>>>
>>> Of course, it is better then nothing, but anyway meta-data remains
>>> ecc-unprotected, and, hence, robustness is not increased..
>>>
>
> _________________________________________________________________
> On the road to retirement? Check out MSN Life Events for advice on how
> to get there! http://lifeevents.msn.com/category.aspx?cid=Retirement
>
>
>

