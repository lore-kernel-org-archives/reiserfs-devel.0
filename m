From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiserfs and nfs.
Date: Tue, 26 Nov 2002 14:11:45 +0300
Message-ID: <15843.22257.733637.646758@laputa.namesys.com>
References: <15842.28332.47095.407177@laputa.namesys.com>
	<E18Gchd-0005jx-00@aqualene.uio.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12046-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <E18Gchd-0005jx-00@aqualene.uio.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Terje Malmedal <terje.malmedal@usit.uio.no>
Cc: Reiserfs-List@Namesys.COM

[lkml trimmed from CC list.]

Terje Malmedal writes:
 > 
 > [Nikita Danilov]
 > > Terje Malmedal writes:
 > >> 
 > >> [Nikita Danilov]
 > >> > Terje Malmedal writes:
 > >> >> 
 > 
 > > [...]
 > 
 > >> 
 > >> To reproduce do something like: 
 > >> $ ls -li RMAIL
 > >> 387607 -rw-------    1 tm       4050     36635726 Nov 20 16:15 RMAIL
 > 
 > > Is RMAIL inode number constant on the server?
 > 
 > No, it is always the same as the number seen over NFS, but I've not
 > seen this problem when I've tried running emacs on the nfs-server
 > itself.

I see following possibilities:

1. some weird mail locking protocol (is RMAIL your mail spool file?)

2. some EMACS/Rmail feature. Are you running identical Emacs
configurations on the client and server?

 > 
 > -- 
 >  - Terje
 > malmedal@usit.uio.no

Nikita.
