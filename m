From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Benchmark : ext3 vs reiser4 and effects of fragmentation.
Date: Thu, 16 Sep 2004 22:00:19 +0300
Message-ID: <20040916190019.GN26192@nysv.org>
References: <4148BC0E.5010509@willsmith.org> <20040916085248.GI5137@backtop.namesys.com> <20040916130809.GI26192@nysv.org> <20040916153835.GK5137@backtop.namesys.com> <20040916155248.GM26192@nysv.org> <20040916183831.GL5137@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21826-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040916183831.GL5137@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: Will Smith <will@willsmith.org>, reiserfs-list@namesys.com

On Thu, Sep 16, 2004 at 10:38:31PM +0400, Alex Zarochentsev wrote:
>
>on-line defragmenter requires its part to be in kernel space. at least node
>locks cannot be exported _safely_ to the user space, I think.

What if it was like 
echo -n "Killer Algo by Zam" > /sys/fs/reiser4/hda1/repacker/algorithm
or something to get rid of the risk of having two really separate
mechanisms, and if it can't be in userspace either way...

This is also probably related to what Nik said back in the days about
an online-fsck being impossible :)

-- 
mjt
