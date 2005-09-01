From: Hans Reiser <reiser@namesys.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 01 Sep 2005 08:25:11 -0700
Message-ID: <43171D57.3030007@namesys.com>
References: <20050901134604.31ddd297@SiRiUS.home>	<20050901144842.34629bcf@SiRiUS.home>	<4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home> <4316FD28.5020304@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25794-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4316FD28.5020304@redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Staubach <staubach@redhat.com>
Cc: vs@namesys.com, reiserfs-list@namesys.com

Peter Staubach wrote:

>
>>> reiser4 reserves 5% of disk space for its internal needs.
>>>
>
> 5% of today's big disks seems a little excessive.  Does reiser4 really
> need
> that much space or would less also suffice without compromising
> performance?
>
> Is there research available which makes up the basis for the 5% number?
>
>    Thanx...
>
>       ps
>
>
Research for filesystems generally says that as you get more than 85%
full the performance goes down, by a lot as you get close to 100%.  5%
is probably too little rather than too much.
