From: Sander <sander@humilis.net>
Subject: Re: Executability problem
Date: Tue, 30 Aug 2005 15:48:27 +0200
Message-ID: <20050830134827.GB27593@favonius>
References: <20050830152859.45e0b010.Kris.VanBruwaene@vrt.be>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25727-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050830152859.45e0b010.Kris.VanBruwaene@vrt.be>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kris Van Bruwaene <Kris.VanBruwaene@vrt.be>
Cc: reiserfs-list@namesys.com

Kris, please linewrap after 72 chars and refrain from posting
non-relevant signatures.

Kris Van Bruwaene wrote (ao):
> I recently discovered that scripts have become non-executable on my reiserfs share, even though the -x flags are set:
> root@A00012344:/home/kris# cat tst
> #! /usr/bin/perl -w
> print "Hello world\n";
> root@A00012344:/home/kris# ./tst
> bash: ./tst: /usr/bin/perl: bad interpreter: Toegang geweigerd #(=Access denied)
> root@A00012344:/home/kris# perl tst
> Hello world
> root@A00012344:/home/kris# cp tst /tmp
> root@A00012344:/home/kris# cd /tmp
> root@A00012344:/tmp# ./tst
> Hello world
> root@A00012344:/tmp# ls tst -l
> -rwxr-xr-x  1 root root 43 2005-08-30 15:19 tst
> root@A00012344:/tmp# ls /home/kris/tst -l
> -rwxrwxr-x  1 kris users 43 2005-08-25 11:00 /home/kris/tst

Can you try:
which perl
ls -l `which perl`
perl -wc /home/kris/tst
/home/kris/tst

and send the output?

-- 
Humilis IT Services and Solutions
http://www.humilis.net
