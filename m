From: Hans Reiser <reiser@namesys.com>
Subject: Re: any tips on optimising samba on reiserfs?
Date: Thu, 16 Jan 2003 14:01:03 +0300
Message-ID: <3E2690EF.2020706@namesys.com>
References: <000601c2bd4b$c2305720$0101a8c0@bummer>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12378-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000601c2bd4b$c2305720$0101a8c0@bummer>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: darren <teodarren@myrealbox.com>
Cc: 'Reiserfs mail-list' <Reiserfs-List@Namesys.COM>

darren wrote:

>Hi all,
>
>I have been trying to setup my reiserfs/samba CIFS file server on my
>LAN.
>
>Although all my benchmarks have been showing good local read write
>performance, I cannot seem to get the most of it over the network with
>samba.
>
>Anyone got any tips on how I can do this?
>
>p.s. I have already done all the obvious optimizations like TCP_NODELAY
>and using SO_SNBUF=16384 blah blah..
>
>
>
>  
>
This is an area where our team is ignorant due to lack of experience, 
but I am very interested in learning from you and other users about it, 
and we are willing to tweak as needed.  Perhaps we should run netbench 
or some such to replicate your situation?  (We don't use much Windows at 
Namesys....)

-- 
Hans


