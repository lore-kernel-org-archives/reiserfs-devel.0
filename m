From: Hans Reiser <reiser@namesys.com>
Subject: Re: implementing reiserfs in C++ for a new OS
Date: Sat, 07 Aug 2004 10:51:20 -0700
Message-ID: <41151698.3020508@namesys.com>
References: <71d3364904080706112e72fb6b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20061-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <71d3364904080706112e72fb6b@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ramachandra K <ariston@gmail.com>
Cc: reiserfs-list@namesys.com

Ramachandra K wrote:

>Hello,
>
>I am planning to implement ReiserFS on my operating system named Capital 
>(www.mitpune.com/research/capital1.html). To give a brief background - 
>Capital is a 32-bit Object Oriented operating system for the Intel
>i386 range of
>microprocessors. Capital's features include multithreading,virtual memory 
>and a VFS interface.
>
>The implementation language of Capital is C++ and hence I, along with my
>team, would like to implement ReiserFS from scratch in C++. I know that
>this is a daunting task requiring considerable effort. The main motivation,
>in addition to implementing an efficient file system for my operating system,
>is to acquire an in depth understanding of the principles behind the design
>of ReiserFS and possibly come up with some new ideas.
>
>It would be of great help if I can get some pointers about how do I go about
>understanding ReiserFS.
>
>Currently I have got a bird's eye view of ReiserFS (plugins, items,
>dancing trees etc).
>But I am still grappling with the following issues:
>
>1)I have not been able to get any information about the on-disk structure
>(i.e where is the superblock, bitmaps etc). I guess I can get it by
>reading the source
> (probably mkreiserfs code would also be helpful). Is there any other
>source of information ?
>  
>
Just the source.  I don't see why reading the source is difficult.  It 
should be easy to convert V4 C to C++ (C++ to C would be harder.....)

>2)All the information that is available at namesys.com is about Reiser4 and
>I would like to know where I could get more information about version 3.
>  
>
Using V3 for a new OS is crazy.  Use V4.  V3 is obsolete.

>I would greatly appreciate suggestions and pointers to more information.
>
>(Please CC the replies to me as I am currently not subscribed to the
>mailing list)
>
>rgds
>Ram
>
>
>  
>
Is it a free OS, or do you need to buy a license from us in addition to 
the GPL?
