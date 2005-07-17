From: Alexander Skwar <listen@alexander.skwar.name>
Subject: Re: Resize of a reiser4 filesystem?
Date: Sun, 17 Jul 2005 17:23:57 +0200
Message-ID: <42DA780D.1070101@mid.alexander.skwar.name>
References: <42DA6EBE.7020100@mid.alexander.skwar.name> <op.st2cqe1kth1vuj@localhost>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.st2cqe1kth1vuj@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

PFC schrieb:
> 	I've got Gentoo and this is installed :
> 
>    sys-fs/reiser4progs
>        Latest version available: 1.0.4
>        Latest version installed: 1.0.3
> 
> I believe the name of the tool has changed and is now resizefs.reiser4

[17:21:48 alexander@server:~] $ grep resize /var/db/pkg/sys-fs/reiser4progs-1.0.4/CONTENTS
[17:21:48 alexander@server:~] $

IOW: On my system, there's no "resize" program in the reiser4progs
package.

In 1.0.3, I also had that manpage - but I had no binary. Do you
have a binary?

Alexander Skwar
-- 
Think honk if you're a telepath.
