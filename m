From: "Andrew Snare" <asnare@allshare.nl>
Subject: Re: Block corruption
Date: Tue, 08 Jun 2004 16:31:32 +0200
Message-ID: <s0c5e9fc.070@allshare.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19087-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vs@namesys.com
Cc: Paul Wagland <PWagland@allshare.nl>, reiserfs-list@namesys.com

Vladimir Saveliev suggested:
> Well, reiserfs needs to include device name into its warnings
> Until it is not done you might want to do
> 
> find /mountpoint -inum 52653 
> for each of your reiserfs filesystem.

That number comes from the vs-13070 messages. They're of the form:
> vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to
> find stat data of [52570 52653 0x0 SD]

What are these numbers near the end? You've referred to the second as
the inode, but we'd like to understand more clearly what's going on.

Cheers,

 - Andrew
