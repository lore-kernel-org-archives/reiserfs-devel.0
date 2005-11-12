From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: Slowdown is gone & apt-get works with updated reiser4. So nevermind...
Date: Sat, 12 Nov 2005 21:57:55 +0100
Message-ID: <43765753.9070801@ursynow.2a.pl>
References: <200511111359.39715.jgilmore@glycou.com> <b14e81f00511111907l3c159ff7rd2e0de5f9e6a0aa7@mail.gmail.com> <43758E00.4000601@namesys.com> <200511120906.39109.jgilmore@glycou.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26883-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511120906.39109.jgilmore@glycou.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Gilmore <jgilmore@glycou.com>
Cc: reiserfs-list@namesys.com


> On Saturday 12 November 2005 06:38, Hans Reiser wrote:
>   
>> Being seamless, cleanly implemented, and requiring little or no admin
>> work, matters a lot to end users.
>>     
> Amen, Brother!
>
>
>   
>> Yes, users can do what you said with rsync, but it is important that it
>> be no more work than specifying a --use-versioning mount option, and
>> even that is beyond most users (but that is where defaults come in to
>> help them).
>>
>> The namespace for the past versions should be as cleanly done as WAFL
>> does them.  Whether space gets freed automatically when space gets <10%
>> is another mount option.  Where we might do better than WAFL is in
>> allowing touching filename/..../checkin to cause a version to get
>> recorded, rather than doing it at particular times.
>>
>> Hans
>>     
> Of particular concern is that the name space should (somehow) allow me to 
> easily grab version by date, even if the file hadn't changed for the two 
> weeks before that, and in fact still hasn't changed... Make it really easy to 
> grab all or some files by wildcard and with a specific revision, even when 
> not every file changed with that revision.
>
> Oh, BTW. "The slowdown" as I called it is still there. I guess I spoke to 
> soon. The specific symptom is that the effected process locks for a time, 
> usually just a second or two, but sometimes a minute or two and and at least 
> once for many many minutes. I think that the crash (soft lockup) that I 
> reported earlier is related as well. And it sounds like the comment that 
> rvalles had about lockups with mmaped files, except that it doesn't lock up 
> permanently. Just for a second or three usually.
>
>
> .
>
>   
yes, its exactly the same with my case. it locks up just for few 
seconds, sometimes one/two minutes when using for example vim... but 
sometimes it locks up completly, machine is responding to ping but i 
cannot login, dns is not working and all services seems down. (but it is 
replying to ping)

it can happen up to 2-3 times per day. (usually only once per day or 
once per 2 days)

there is completly no info about anything in any log files.

i already installed latest kernel 2.6.14.2 and lates 2.6.14-1 reiser4 
patch and its the same.

My users are getting angry becouse of the downtimes... is this bug 
noticed by dev team ? This seems really serious, as it is causing 
sporadic crashesh and often short lock-ups. Any quick-fix please? It is 
happening for quite some time now so this is not new bug. thats why i 
keep asking... is it worked on or not?

thanks in advance

