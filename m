From: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Subject: Re: implementing reiserfs in C++ for a new OS
Date: Sat, 07 Aug 2004 17:05:31 +0200
Message-ID: <4114EFBB.6030208@futuretg.com>
References: <71d3364904080706112e72fb6b@mail.gmail.com> <1091890489.14965.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20059-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1091890489.14965.2.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: redeeman@metanurb.dk
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Redeeman wrote:

Hi,

    I suppose you are using GNU/Linux ... and therefore, you don't need 
to re-write nothing
    in C++, because is connected with the kernel and the kernel had been 
written in C, not in C++.

    Second, the name is a little 'comic' for me, if it is OpenSource.

    If you will adopt a Kernel different than Linux ... good luck.

Thanks,
Giovanni

>i suggest implementing reiser4 instead
>
>On Sat, 2004-08-07 at 18:41 +0530, Ramachandra K wrote:
>  
>
>>Hello,
>>
>>I am planning to implement ReiserFS on my operating system named Capital 
>>(www.mitpune.com/research/capital1.html). To give a brief background - 
>>Capital is a 32-bit Object Oriented operating system for the Intel
>>i386 range of
>>microprocessors. Capital's features include multithreading,virtual memory 
>>and a VFS interface.
>>
>>The implementation language of Capital is C++ and hence I, along with my
>>team, would like to implement ReiserFS from scratch in C++. I know that
>>this is a daunting task requiring considerable effort. The main motivation,
>>in addition to implementing an efficient file system for my operating system,
>>is to acquire an in depth understanding of the principles behind the design
>>of ReiserFS and possibly come up with some new ideas.
>>
>>It would be of great help if I can get some pointers about how do I go about
>>understanding ReiserFS.
>>
>>Currently I have got a bird's eye view of ReiserFS (plugins, items,
>>dancing trees etc).
>>But I am still grappling with the following issues:
>>
>>1)I have not been able to get any information about the on-disk structure
>>(i.e where is the superblock, bitmaps etc). I guess I can get it by
>>reading the source
>> (probably mkreiserfs code would also be helpful). Is there any other
>>source of information ?
>>
>>2)All the information that is available at namesys.com is about Reiser4 and
>>I would like to know where I could get more information about version 3.
>>
>>I would greatly appreciate suggestions and pointers to more information.
>>
>>(Please CC the replies to me as I am currently not subscribed to the
>>mailing list)
>>
>>rgds
>>Ram
>>
>>    
>>


-- 

-- 

--
Check FT Websites ... 
http://www.futuretg.com  - ftp://ftp.futuretg.com
http://www.FTLinuxCourse.com
	http://www.FTLinuxCourse.com/Certification
http://www.rpmparadaise.org
http://GNULinuxUtilities.com
http://www.YourPersonalOperatingSystem.com

--

