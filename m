From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: 24 Feb 2003 12:49:00 -0500
Message-ID: <b3dluc$n39$1@satsuki.furryterror.org>
References: <20030220175309.A23616@namesys.com>
Return-path: <reiserfs-list-return-12891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <20030220175309.A23616@namesys.com>,
Oleg Drokin  <green@namesys.com> wrote:
>   So we solved that with patch below (Zygo, others who think they have this problem,
>   please check).

I am building a kernel with the patch as I type this.  I'll know if it works 
in a few hours.

If it does work, I'll be running reiserfsck for the rest of the week to
clean out all those dead direntries on all my systems once and for all.
:-P

Reiserfsck takes 53 hours to scan everything on some of my machines,
which is a long time considering that I already know where all the
missing direntries are since they are recorded in various error log files.

I don't suppose it's a quick or easy task to modify reiserfsck to just fix
_one_ missing directory entry, or to allow the kernel to unlink missing
direntries instead of returning EPERM?  Would it suffice to simply hack
up the unlink() code so that the direntry is removed but the missing 
SD is ignored?

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
