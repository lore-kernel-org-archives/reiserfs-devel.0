From: Hans Reiser <reiser@namesys.com>
Subject: Re: REISER4 - A simple test with a filesystem and Oracle
Date: Fri, 16 Jan 2004 22:33:04 +0300
Message-ID: <40083C70.6060800@namesys.com>
References: <20040116191526.47585.qmail@web21502.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16556-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040116191526.47585.qmail@web21502.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paolo Correnti <paolunix@yahoo.com>
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

Well, ignore my email just sent since sync had no effect.

Let us have grev or you experiment with doing things like file 
overwrites in near to out of disk space situations, and see if we are 
doing a proper job of forcing commits when we get low on disk space.

-- 
Hans


