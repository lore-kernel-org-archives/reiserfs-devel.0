From: "David Boutcher" <boutcher@us.ibm.com>
Subject: Re: Memory Corruption
Date: Wed, 28 Aug 2002 16:00:15 -0500
Message-ID: <29659.0204038241$1030568405@news.gmane.org>
References: <1029787262.12471.390.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11336-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1029787262.12471.390.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org


>On Mon, 2002-08-19 at 12:50, Dave Boutcher wrote:
>> Hi,
>>
>> I'm chasing a wierd memory corruption problem on a ppc64 system.  The
>> first byte of a slab_t structure keeps getting stepped on (zeroed,
>> actually.)  This happens during a testcase that copies a large file
>> called "junk" between file systems (a mix of ext2 and reiser) on a
>> 2.4.13 kernel.  I know that's REALLY REALLY old, but it's whats in
>> SuSE's SLES-7 release that we have customers running...
>
>Any chance the test case involves renames?
>
>-chris

So I posted my problem with memory corruption a few weeks ago....and the
problem turned out to be a REALLY old/moldy set of userland reiser tools.
I don't know exactly why that caused memory corruption in the kernel, but
updating the tools fixed everything right up.

Dave B


