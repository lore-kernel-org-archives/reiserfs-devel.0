From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Repacker for reiser4?
Date: Mon, 13 Sep 2004 21:36:32 +0300
Message-ID: <20040913183632.GF26192@nysv.org>
References: <4144674B.5070705@willsmith.org> <20040912151537.GE26192@nysv.org> <4145DC12.90103@willsmith.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21721-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4145DC12.90103@willsmith.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Smith <will@willsmith.org>
Cc: reiserfs-list@namesys.com

On Tue, Sep 14, 2004 at 01:42:42AM +0800, Will Smith wrote:
>
>As far as I can tell (can anybody confirm/deny), it's up to userspace
>to manually toggle the 'direction' flag as required before starting
>the repacker - the direction seems to default to 0 ('backward') on each 
>mount.

Sure seems that way...

>sequence of operations on each filesystem.  And then, whether the
>repacker fixes things for reiser4.  Naturally, ext3 fragmentation
>cannot be fixed :)

I heard a rumor that ext3's fragmentation is fixed by fsck, can anyone
deny or confirm this?

How do you measure ext3's fragmentation, btw?
(An old reiserfs user asking ;)

-- 
mjt

