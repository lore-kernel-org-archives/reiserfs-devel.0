From: Joe Feise <jfeise@feise.com>
Subject: Re: Read errors from r/o-mounted reiser4
Date: Mon, 02 Jan 2006 01:04:14 -0800
Message-ID: <43B8EC8E.3020500@feise.com>
References: <43B221E3.3020201@feise.com> <1135823501.6469.63.camel@tribesman.namesys.com>
Reply-To: jfeise@feise.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27571-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1135823501.6469.63.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Vladimir V. Saveliev wrote on 12/28/05 18:31:

> Hello
> 
> On Tue, 2005-12-27 at 21:25 -0800, Joe Feise wrote:
>> Hi,
>>
>> in one of my systems, I have /usr on a Reiser4 partition.
>> When I have that partition mounted read-only, I get errors whenever
>> I try to compile anything. Other programs that read from that partition also
>> seem to fail, but I don't get such nice output like the stuff from gcc.
>> I am currently using Slackware 10.2 with kernel 2.6.15-rc5-mm3, but I have
>> experienced the same problem with earlier kernels as well.
>> The output from a make menuconfig in the kernel source dir:
> 
> Thanks for the report. We will take a look
> 
>> $: make menuconfig
>>
>>   HOSTCC  scripts/kconfig/conf.o
>> In file included from /usr/include/bits/types.h:31,
>>
>>                  from /usr/include/ctype.h:28,
>>                  from scripts/kconfig/conf.c:6:
>> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: syntax
>> error before '}' token


I thought about this a bit more, and decided to take a look at the stddef.h file.
As it turns out, the file has only 419 lines, so line 420 is past the end of the
file.
That indicates to me that there is possibly a buffer that doesn't get cleared if
the fs is mounted r/o (an optimization gone wrong, maybe?)

-Joe
