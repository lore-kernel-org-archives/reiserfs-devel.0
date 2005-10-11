From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser3 and O_DIRECT read
Date: Tue, 11 Oct 2005 16:06:04 +0400
Message-ID: <434BAAAC.2030403@namesys.com>
References: <Pine.LNX.4.61.0510071208030.1805@dacun.noviforum.si> <4346784A.1050208@namesys.com> <Pine.LNX.4.61.0510101223390.3955@dacun.noviforum.si> <434A5D19.2030006@namesys.com> <Pine.LNX.4.61.0510101428500.3955@dacun.noviforum.si> <434A67EB.5070600@namesys.com> <Pine.LNX.4.61.0510101734440.3955@dacun.noviforum.si> <434B5759.1090604@namesys.com> <Pine.LNX.4.61.0510110834110.3955@dacun.noviforum.si> <434B6A1B.4030702@namesys.com> <Pine.LNX.4.61.0510110955320.3955@dacun.noviforum.si>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26474-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.61.0510110955320.3955@dacun.noviforum.si>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gorazd Golob <gorazdg@noviforum.si>
Cc: reiserfs-list@namesys.com

Hello

Gorazd Golob wrote:
> 
> Vladimir,
> 
> I forgot to tell that we're using x86_64.

ok

> Kernel is:
> Linux xxxx 2.6.12.6 #6 SMP Thu Sep 15 12:29:53 CEST 2005 x86_64 Intel(R)

Did you find parameters with which the program behaves differently for a file on
ext2 and reiserfs?

> Xeon(TM) CPU 3.00GHz GenuineIntel GNU/Linux
> 
> On Tue, 11 Oct 2005, Vladimir V. Saveliev wrote:
> 
>> Hello
>>
>> Gorazd Golob wrote:
>>>
>>> ;(
>>>
>>> works ok if file is bigger than about 4000 bytes. Otherwise read failed.
>>>
>> Yes, using O_DIRECT you should care about alignment to boundary of 512
>> bytes for
>> address of buffer you read to, size of that buffer and offset in a
>> file to read
>> from.
>>
>> Please try this version of test program and let us know how to make it
>> to behave
>> differently for file in reiserfs and ext2.
>> What is version of kernel you use?
>>
> 
> 

