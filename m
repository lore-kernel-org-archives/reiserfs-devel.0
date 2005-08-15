From: David Masover <ninja@slaphack.com>
Subject: Re: where is the journal kept?
Date: Mon, 15 Aug 2005 10:52:18 -0500
Message-ID: <4300BA32.7080101@slaphack.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com> <20050815125025.GA29390@tranquility.scriptkitchen.com> <43009184.2080201@namesys.com> <200508150812.40382.pat@patdouble.com> <4300A603.2050602@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25483-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4300A603.2050602@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: pat@patdouble.com, reiserfs-list@namesys.com


Vladimir V. Saveliev wrote:
> Hello
> 
> Pat Double wrote:
> 
>> Stupid, question. I thought that reiser4 had no journal, 
> 
> 
> reiser4 has no filesystem area dedicated for journal.
> Instead it allocats log(journal) records dynamically.
> 
> it is transactional.
> 
>> If that's the case, why this option in debug.reiser4 :
>>
>> Usage: /sbin/debugfs.reiser4 [ options ] FILE
>> Print options:
>>    -j, --print-journal           prints journal.
>>
> 
> yes, this prints reiser4 "wandering logs".


Not to beat a dead horse, but it might make things go faster if people 
thought of the journal as an invisible, inaccessible file, because 
everyone knows that files can be fragmented, and everyone also knows 
that fragmented files can be reassembled and serialized (cat file). 
Only possible difference is, I don't know if the reiser4 log comes out 
of debugfs in any particular order.

It's an oversimplification, but probably a useful one.

