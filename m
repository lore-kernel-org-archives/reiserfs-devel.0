From: Oleg Drokin <green@namesys.com>
Subject: Re: symlink has wrong sd_blocks count
Date: Tue, 18 Feb 2003 14:42:43 +0300
Message-ID: <20030218144243.A6891@namesys.com>
References: <3E5210A5.1030108@dsvr.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12811-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E5210A5.1030108@dsvr.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Burrett <nick@dsvr.net>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Feb 18, 2003 at 10:53:25AM +0000, Nick Burrett wrote:

> I'm running a stock 2.4.20 kernel with the reiserfs quota patches applied.
> Simply creating a symlink and then running reiserfsck shows errors like 
> this:
>    /foofile 2 4 has wrong sd_blocks 8, has to be 1
> I've reproduced this 100% on 100 filesystems on two servers.

Aha, I see.
Ignore this message for now for directories and symlinks.
This is because when reiserfs calculates number of blocks file would use,
in case of no quota, reiserfs code does this and can do this precisely
(up to 512 bytes), but with quota patches applied, quota code takes
account of blocks used. And it round everything up to blocksize, hence
the difference. And reiserfsck uses only 1st variant of the code.
I am not yet sure on how to deal with the issue.
Just ignore this message for now.

Bye,
    Oleg
