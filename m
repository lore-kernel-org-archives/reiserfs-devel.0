From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: shrink reiserfs
Date: Sun, 23 Jan 2005 20:11:06 +0300
Message-ID: <20050123171105.GG10921@backtop.namesys.com>
References: <17956.62.135.89.53.1106495294.squirrel@mail.infinitylimited.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23193-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <17956.62.135.89.53.1106495294.squirrel@mail.infinitylimited.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jake Hawkes <jake@infinitylimited.net>
Cc: reiserfs-list@namesys.com

Hello,

On Sun, Jan 23, 2005 at 08:48:14AM -0700, Jake Hawkes wrote:
> Hi.
> 
>  resize_reiserfs says that there are already too many allocated blocks.

which resize_reiserfs command produces the error message?

> This isn't the exact error message, but I hope you get the idea.
> 
> jake@jacobh jake $ df -h
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/hda4              38G  7.1G   31G  20% /
> /dev/hda2              16G   15G  1.6G  91% /mnt/xp
> none                  506M     0  506M   0% /dev/shm
> 
> 
> so how can this be possible if it is only 20% used?

the shrinker can't make the fs less than 7.1G in size.

-- 
Alex.
