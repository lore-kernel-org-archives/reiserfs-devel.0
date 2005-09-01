From: "LiFe" <LiFers@optusnet.com.au>
Subject: Re: WinFS beta out
Date: Thu, 1 Sep 2005 18:24:13 +1000
Message-ID: <033501c5aece$8b2f8350$d60310ac@homedom>
References: <e692861c0508292136543a02e1@mail.gmail.com> <43147EFE.2020804@perkel.com> <df2lhc$brk$1@sea.gmane.org> <200508310100.06889.chrivers@iversen-net.dk> <028201c5ae18$edcfe4c0$d60310ac@homedom> <b14e81f005083106453fd2605b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25773-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: michael chang <thenewme91@gmail.com>
Cc: Christian Iversen <chrivers@iversen-net.dk>, reiserfs-list@namesys.com

A souped up version that makes data accessable to all applications designed 
to take advantage of it. Which, if you think about it, is what MS has been 
saying they're intending to do for ages.

As for space usage, I'm sure it won't use more than Google Desktop Search 
does, indexing every bit of everything.

Speed? The SQL engine seems to be about as fast as google desktop search, so 
pretty fast. Unfortunately, as indicated before, they seem to have based the 
bit storage mechanism on NTFS, so slow writes, massive fragmentation, 
breakable jounaling.


----- Original Message ----- 
From: "michael chang" <thenewme91@gmail.com>
To: "LiFe" <LiFers@optusnet.com.au>
Cc: "Christian Iversen" <chrivers@iversen-net.dk>; 
<reiserfs-list@namesys.com>
Sent: Wednesday, August 31, 2005 11:45 PM
Subject: Re: WinFS beta out


> On 8/31/05, LiFe <LiFers@optusnet.com.au> wrote:
>> Interestingly WinFS will revamp permissions drastically. Any query can be
>> joined with any other query of like data.
>>
>> The queries are designed to return the data almost immediately, so it 
>> works
>> fast.
>>
>> Queries can be much more complex.
>
> This sounds like it's basically a souped-up version of Window's
> Indexing service... and it sounds like it could take a heck of a lot
> of room.
>
> -- 
> ~Mike
> - Just my two cents
> - No man is an island, and no man is unable.
> 

