From: Sergey Ivanov <seriv@parkheights.dyndns.org>
Subject: Re: Poor performance (was Re: strange reiser4 messages in /var/log/messages)
Date: Wed, 08 Mar 2006 12:35:20 -0500
Message-ID: <440F15D8.70302@parkheights.dyndns.org>
References: <440CC07D.3050802@parkheights.dyndns.org>	 <440DBF5C.3010808@parkheights.dyndns.org> <5f0e26840603080213x413f0bc1i3be7b3a546be70d2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28233-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5f0e26840603080213x413f0bc1i3be7b3a546be70d2@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jindrich Makovicka <makovick@kmlinux.fjfi.cvut.cz>, reiserfs-list@namesys.com

Jindrich, thank you very much!
I have just finished new test with reiser4 /var/spool mounted with
noatime and nodiratime options.
And, having 34 reiser4 whoes in /var/log/messages during 3 hours, I've
got delivery rate 120 messages/sec, that is clearly better than ext3
with noatime. And reception rate was also pretty good - 147 messages/sec.
I'll redo the tests with nodiratime set for ext3, - I did not know about
such option.
But the "flushing like mad" cases remain problem, - I  can see they
result in lost connections with smtp-source mailgenerator. And if it may
result in data corruption, it's totally unexeptable. Hope it's not.
-- 
    Sergey.

Jindrich Makovicka wrote:
> On 3/7/06, Sergey Ivanov <seriv@parkheights.dyndns.org> wrote:
>   
>> This is the result of testing SMTP server on the same machine with the
>> /var/spool partition formatted once as reiser4, and once as ext3.
>> The server was accepting messages from smtp-source generating messages
>> of with 20k byte length in 40 parallel sessions on another host, and
>> sending it to another machine running smtp-sink for /dev/nulling all
>> these traffic. The only difference was the filesystem, once reiser4 and
>> once ext3.
>> The difference was very clear, while on ext3 sendmail manage to deliver
>> 103.74 msg/sec, on reiser4 it gives only 36.25 messages/sec. 1 message
>> delivery involves reading and deleting 2 files in /var/spool. On ext3 it
>> receives 159.49 msg/sec, while on reiser4 - only 40.31 msg/sec.
>> Receiving a message involves creating 2 files, one for the message and
>> one small file for smtp information about it.
>> I hope this poor reiser4 performance is due to this conditions,
>> reflected in /var/log/messages, and will be fixed.
>>     
>
> Did you try mounting Reiser4 with noatime & nodiratime? Another
> possibility is that the slowdown is due to poor fsync() performance.
>
> --
> Jindrich Makovicka
>   

