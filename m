From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Benchmark : ext3 vs reiser4 and effects of fragmentation.
Date: Thu, 16 Sep 2004 18:52:48 +0300
Message-ID: <20040916155248.GM26192@nysv.org>
References: <4148BC0E.5010509@willsmith.org> <20040916085248.GI5137@backtop.namesys.com> <20040916130809.GI26192@nysv.org> <20040916153835.GK5137@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040916153835.GK5137@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: Will Smith <will@willsmith.org>, reiserfs-list@namesys.com

On Thu, Sep 16, 2004 at 07:38:36PM +0400, Alex Zarochentsev wrote:

>We are not going to add more intelligence to the in-kernel repacker module but
>design an interface between repacker and user-space programs and implement
>reisizing alg. in user-space. 

This sounds a bit fishy; is it about having two repackers then?
One in kernelspace and one in userspace?
Will the kernelspace one be obsoleted?

>> >unmergable units shouldn't be problem for the reiser4 kernel code.
>> What are their significance; what do they mean?
>two extent units (start1, len1), (start2, len2) can be merged into one (start1,
>len1 + len2) because start1 + len1 == start2.  I think no reiser4 kernel code
>depends on that mergable extents do not exist.

Unmergable units are then (start1 + len1) != start2 because the repacker
messed this up? 

The kernel finds the extent units from their "old places" without optimizing
them to one unit?

-- 
mjt

