From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Benchmark : ext3 vs reiser4 and effects of fragmentation.
Date: Thu, 16 Sep 2004 16:08:09 +0300
Message-ID: <20040916130809.GI26192@nysv.org>
References: <4148BC0E.5010509@willsmith.org> <20040916085248.GI5137@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21811-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040916085248.GI5137@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: Will Smith <will@willsmith.org>, reiserfs-list@namesys.com

On Thu, Sep 16, 2004 at 12:52:49PM +0400, Alex Zarochentsev wrote:

>> 3) the repacker can bring performance of reiser4 back
>>    to full speed, but only if run several times.
>yes, we had similar results.  it is so cool that reiser4 repacker effect
>is visible outside namesys :)

S'cuse me, but why does it have to be run several times?
A bug to be fixed?

>> 4) the repacker is not yet stable - I had to run fsck
>>    a few times after repacking, and once got a kernel
>>    stack trace during repacking resulting in an
>>    un-unmountable filesystem.
>unmergable units shouldn't be problem for the reiser4 kernel code.

What are their significance; what do they mean?

Basically warnings are scary, even if they were harmless :)

Thanks!

-- 
mjt

