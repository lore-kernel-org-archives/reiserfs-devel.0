From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: where is the journal kept?
Date: Mon, 15 Aug 2005 18:26:11 +0400
Message-ID: <4300A603.2050602@namesys.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com> <20050815125025.GA29390@tranquility.scriptkitchen.com> <43009184.2080201@namesys.com> <200508150812.40382.pat@patdouble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25481-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200508150812.40382.pat@patdouble.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: pat@patdouble.com
Cc: reiserfs-list@namesys.com

Hello

Pat Double wrote:
> Stupid, question. I thought that reiser4 had no journal, 

reiser4 has no filesystem area dedicated for journal.
Instead it allocats log(journal) records dynamically.

it is transactional.
> If that's the case, why this option in debug.reiser4 :
> 
> Usage: /sbin/debugfs.reiser4 [ options ] FILE
> Print options:
>    -j, --print-journal           prints journal.
> 

yes, this prints reiser4 "wandering logs".

> 
> On Monday 15 August 2005 07:58 am, Vladimir V. Saveliev wrote:
> 
>>Hello
>>
>>Payal Rathod wrote:
>>
>>>On Mon, Aug 15, 2005 at 04:25:37PM +0400, Vladimir V. Saveliev wrote:
>>>
>>>>Each journaling filesystem keeps its journal by its own way.
>>>>In reiserfs by default journal is kept in statically pre-allocated on
>>>>mkfs time 8192 blocks (4096 bytes each) starting from 18-th block.
>>>
>>>Is it kept in some sort of file?
>>
>>No. That area of filesystem does not belong to any files stored on that
>>filesystem. You can read it from device directly: dd if=/dev/hda1 bs=4096
>>count=8192. I am not sure that it can be of any interest, because you will
>>see just binary data.
>>
>>I mean can I see the file contents
>>
>>
>>>using normal UNIX tools? If yes how do I do it?
>>
>>You can use
>>debugreiserfs -j /dev/hda1 /dev/hda1
>>to see journal content. This will decode binary data into human readable
>>form.
>>
>>
>>>With warm regards,
>>>-Payal
> 
> 

