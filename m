From: Hans Reiser <reiser@namesys.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 20:11:52 -0800
Message-ID: <41D4D188.4070904@namesys.com>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>	<m38y7gx8kq.fsf@merlin.emma.line.org>	<20041230235911.4911a20c.hihone@bigpond.net.au>	<m3sm5nj2ef.fsf@merlin.emma.line.org>	<87is6jpvdu.fsf@quasar.esben-stien.name>	<20041230174732.GB5206@favonius>	<234966540.20041230192607@tnonline.net> <m3brcbqsz6.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22989-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3brcbqsz6.fsf@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Cc: Spam <spam@tnonline.net>, reiserfs-list@namesys.com

Matthias Andree wrote:

>Spam <spam@tnonline.net> writes:
>
>  
>
>>  In any case. Undelete has been since ages on many platforms. It IS a
>>  useful feature. Accidents CAN happen for many reasons and in some
>>  cases you may need to recover data.
>>
>>  Besides, a deletion does not fully remove the data, but just unlinks
>>  it. In Reiser where there is tailing etc for small files this can be
>>  a problem. Either the little file might not be able to be recovered
>>  (shouldn't the data still exist, even if it is tailed), or the user
>>  need to use a non-tailing policy?
>>    
>>
>
>A working undelete can either hog disk space or die the moment some
>large write comes in. And if you're at that point, make it a versioning
>file system
>
Well, yes, it should be one.....

darpa is paying for views, add in a little versioning and.....

> - but then don't complain about space efficiency.
>  
>
This is an area where apple was smarter than Unix.  Having a trash can 
is what real users need, more than they need performance..

Yes, there is a high performance cost, but so long as it can be turned 
off/ avoided, the cost is acceptable.

I would however auto-empty the trash can when space got low....

>  
>
>>  well, overwritten data is not so easy to get back. But from what I
>>  understand in Linux, is that many applications actually write
>>  another file and then unlinks the old file? If that is the case then
>>  it may even be possible to get back some overwritten files!
>>    
>>
>
>I see enough applications to just overwrite an output file. 
>
>This whole discussion doesn't belong here until someone talks about
>implementing a whole versioning system for reiser4.
>
>  
>
Well, it hasn't been coded solely because we haven't gotten around to it 
what with all else that needs doing and still needs doing.  Remind me 
about this in a year.:)

Hans
