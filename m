From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: undelete open file
Date: Wed, 10 Mar 2004 15:39:21 +0300
Message-ID: <1078922361.9476.120.camel@tribesman.namesys.com>
References: <404F0899.2040000@gbf.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <404F0899.2040000@gbf.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joachim Reichelt <Reichelt@gbf.de>
Cc: reiserfs-list@namesys.com

On Wed, 2004-03-10 at 15:22, Joachim Reichelt wrote:
> Dear all,
> 
> is there a way to undelete a file, that is still open?
> lsof -C ... gives
> Bragi   29736  jre   15r   REG        3,8  6828032    480646 
> /home/jre/susanne_h/Model.md_ntr.mdcrd (deleted)

cat /proc/NUM/fd/FD > copy-of-file

where NUM is pid of process having that file open
FD - file descriptor of removed file

