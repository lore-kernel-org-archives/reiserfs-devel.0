From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: Permission denied !? - will i ever update my system again ?
Date: Wed, 17 Jul 2002 18:10:32 -0400
Message-ID: <200207171810.32567.tomlins@cam.org>
References: <1026942850.826.13.camel@prototype>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11039-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1026942850.826.13.camel@prototype>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Moritz Angermann <moritz.angermann@gmx.net>, reiserfs-list@namesys.com

To me, it looks like you have fs corruption...  You can try a reboot as see
if it fixes the problem (bet it will not).   You have three options.  First is to
live with the problem.  Second is to update reiserfsck to the latest and run
reiserfsck - I have used this option many times and its has worked well.  The
third option is to backup, recreate the fs, and restore.

If I were you I would backup anything critical, update reiserfsck run it.

Ed Tomlinson


On July 17, 2002 05:54 pm, Moritz Angermann wrote:
> well
> hi all,
> now after using reiserFS for a very long term without any problems
> i'm facing a totaly new one and i'm helpless.
> the problem is, while apt-get dist-upgrade, you all know this
> command,[or not]
> i get :
> can't access ./usr/include/arpa/telnet.h (...): permission denied
>
> so i did ls -lah /usr/include/arpa/
> the result : ( as root )
> ---
> #>ls -lah /usr/include/arpa/
> ls: /usr/include/arpa/telnet.h: Permission denied
> ls: /usr/include/arpa/tftp.h: Permission denied
> insgesamt 51K
> drwxr-xr-x    2 root     root          181 2002-07-17 23:21 .
> drwxr-xr-x   92 root     root         6.2K 2002-07-17 23:21 ..
> -rw-r--r--    1 root     root         3.4K 2002-06-24 18:57 ftp.h
> -rw-r--r--    1 root     root         4.3K 2002-06-24 18:57 inet.h
> -rw-r--r--    1 root     root         5.9K 2002-06-24 18:57
> nameser_compat.h
> -rw-r--r--    1 root     root          20K 2002-06-24 18:57 nameser.h
> (root@prototype/Wed Jul 17//home/cone/4)
> #>
> ---
>
> doesn't look any good, does it !? ...
> so i tryed my HD-vendors tool.
> WesternDigital...
> but it told me my disk was 100% ok.
> ( it did also tell me a while ago, my dist had errors, so it corrected
> em, awesome tool :p )
> ---
> but now, what can i do about it ? reiserfsck ? well it keeps telling me
> about unsable and i shall not use it ...
>
> so any ideas ?
>
> thanks.
>
> -moritz

