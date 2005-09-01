From: Peter Staubach <staubach@redhat.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 01 Sep 2005 13:36:32 -0400
Message-ID: <43173C20.7070107@redhat.com>
References: <20050901134604.31ddd297@SiRiUS.home>	<20050901144842.34629bcf@SiRiUS.home>	<4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home> <4316FD28.5020304@redhat.com> <43171D57.3030007@namesys.com> <431726F2.1090508@redhat.com> <43173463.40302@slaphack.com> <43173A11.2000801@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25801-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43173A11.2000801@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, vs@namesys.com, reiserfs-list@namesys.com

Hans Reiser wrote:

>>>>        
>>>>
>>>Wow.  What is all that space used for?  Other journalling file
>>>systems that
>>>I have seen have limited things like journals to a much smaller space,
>>>      
>>>
>BSD FFS has a 10% limit unless you are root.  They are correct to do so.
>

Yes, they reserve that space so that their algorithms to choose blocks from
the various cylinder groups can continue to choose blocks in decent 
locations.
BSD FFS doesn't journal though.

The SunOS UFS does journal metadata and retains the same 10% limit.  It was
discovered that the journal didn't need to be very big in order to maximize
performance though.  A very small log would do as well as a very large log.

It would be interesting to pick a benchmark which represents some market
that usually deploys reiersfs and then experiment with various aspects of
the file system, including the reserve space.  It is easy to do, mostly
just time consuming and requires a fair amount of resources.

       ps
