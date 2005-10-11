From: Gorazd Golob <gorazdg@noviforum.si>
Subject: Re: reiser3 and O_DIRECT read
Date: Tue, 11 Oct 2005 09:56:36 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510110955320.3955@dacun.noviforum.si>
References: <Pine.LNX.4.61.0510071208030.1805@dacun.noviforum.si>
 <4346784A.1050208@namesys.com> <Pine.LNX.4.61.0510101223390.3955@dacun.noviforum.si>
 <434A5D19.2030006@namesys.com> <Pine.LNX.4.61.0510101428500.3955@dacun.noviforum.si>
 <434A67EB.5070600@namesys.com> <Pine.LNX.4.61.0510101734440.3955@dacun.noviforum.si>
 <434B5759.1090604@namesys.com> <Pine.LNX.4.61.0510110834110.3955@dacun.noviforum.si>
 <434B6A1B.4030702@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26470-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <434B6A1B.4030702@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com


Vladimir,

I forgot to tell that we're using x86_64.
Kernel is:
Linux xxxx 2.6.12.6 #6 SMP Thu Sep 15 12:29:53 CEST 2005 x86_64 Intel(R) 
Xeon(TM) CPU 3.00GHz GenuineIntel GNU/Linux

On Tue, 11 Oct 2005, Vladimir V. Saveliev wrote:

> Hello
>
> Gorazd Golob wrote:
>>
>> ;(
>>
>> works ok if file is bigger than about 4000 bytes. Otherwise read failed.
>>
> Yes, using O_DIRECT you should care about alignment to boundary of 512 bytes for
> address of buffer you read to, size of that buffer and offset in a file to read
> from.
>
> Please try this version of test program and let us know how to make it to behave
> differently for file in reiserfs and ext2.
> What is version of kernel you use?
>
