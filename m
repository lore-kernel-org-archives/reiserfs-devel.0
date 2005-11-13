From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: Slowdown is gone & apt-get works with updated reiser4. So nevermind...
Date: Sun, 13 Nov 2005 01:55:06 +0100
Message-ID: <43768EEA.90307@ursynow.2a.pl>
References: <200511111359.39715.jgilmore@glycou.com> <b14e81f00511111907l3c159ff7rd2e0de5f9e6a0aa7@mail.gmail.com> <43758E00.4000601@namesys.com> <200511120906.39109.jgilmore@glycou.com> <43765E8D.7030104@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43765E8D.7030104@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: John Gilmore <jgilmore@glycou.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

Hans Reiser wrote:
> John Gilmore wrote:
> 
>> On Saturday 12 November 2005 06:38, Hans Reiser wrote:
>>  
>>
>>> Being seamless, cleanly implemented, and requiring little or no admin
>>> work, matters a lot to end users.
>>>    
>>>
>> Amen, Brother!
>>
>>
>>  
>>
>>> Yes, users can do what you said with rsync, but it is important that it
>>> be no more work than specifying a --use-versioning mount option, and
>>> even that is beyond most users (but that is where defaults come in to
>>> help them).
>>>
>>> The namespace for the past versions should be as cleanly done as WAFL
>>> does them.  Whether space gets freed automatically when space gets <10%
>>> is another mount option.  Where we might do better than WAFL is in
>>> allowing touching filename/..../checkin to cause a version to get
>>> recorded, rather than doing it at particular times.
>>>
>>> Hans
>>>    
>>>
>> Of particular concern is that the name space should (somehow) 
>>
> somehow = filename/versions/version_number and ls -l filename/versions ?
> 
>> allow me to 
>> easily grab version by date, even if the file hadn't changed for the two 
>> weeks before that, and in fact still hasn't changed... Make it really easy to 
>> grab all or some files by wildcard and with a specific revision, even when 
>> not every file changed with that revision.
>>
>> Oh, BTW. "The slowdown" as I called it is still there. I guess I spoke to 
>> soon. The specific symptom is that the effected process locks for a time, 
>> usually just a second or two, but sometimes a minute or two and and at least 
>> once for many many minutes. I think that the crash (soft lockup) that I 
>> reported earlier is related as well. And it sounds like the comment that 
>> rvalles had about lockups with mmaped files, except that it doesn't lock up 
>> permanently. Just for a second or three usually.
>>
>>  
>>
> zam, please comment.
> 

one more thing im pretty sure of - the 2.6.13mm3 without any reiser4 
additional patches (just clean 2.6.13mm3 as it has reiser4 already 
built) is working fine.

i mean, im not sure if this bug still exists here, but im 100% sure i 
can write vim files easy without any downtime, so this is big difference.

so for everyone with this bug - try clean 2.6.13mm3 from kernel.org. It 
worked for me. i will wait with this kernel for a patch to stable line.

Also - i will test it a little more tomorrow to be sure that this 
version is bug free.

