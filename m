From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Sat, 29 Mar 2003 19:22:06 +0100
Message-ID: <200303291922.06095.bernd-schubert@web.de>
References: <200303281828.55093.bernd-schubert@web.de> <200303291606.54910.bernd-schubert@web.de> <20030329203711.A16762@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13438-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030329203711.A16762@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hello!

> See the patch below.
> It should not break anything.

Thanks a lot for the patch, I'm going to test it tomorrow.

>
> > The problems is to detect if this is really caused by this race. Since I
> > still
>
> Well, race is of type when several parallel processes try to access the
> file whose inode is not in memory.
> This resembles what you describe with lots of clients accessing
> same file over NFS at the same time.

Ah, good to know, so I could trigger this when I write a script that reads a 
file on the server as endless loop. Runing this on all clients and then 
rebooting server, should cause a problem for this file, shouldn't it ?
This way we could prove that the patch helps.


Best regards,
	Bernd

