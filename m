From: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Subject: Re[2]: [reiserfs-dev] Re: [ANNOUNCE] reiser4 snaphots
Date: Wed, 6 Nov 2002 13:20:43 +0200
Message-ID: <9918235451.20021106132043@kgpa.ru>
Reply-To: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11928-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Resent-Message-Id: <E189OFD-0001DM-00@main.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS-List <reiserfs-list@namesys.com>

Hello Nikita,

Wednesday, November 6, 2002, 12:17:16 PM, you wrote:

ND>  > > http://namesys.com/snapshots/2002.11.05/
ND>  > 
ND>  > This is just a fyi.
ND>  > 
ND>  > The reiserfsprogs in this dir don't compile to the end for me with 
ND>  > gcc3.2:
ND>  > gcc (GCC) 3.2 20020903 (Red Hat Linux 8.0 3.2-7)
ND>  > 
ND>  > redhat 8.0
ND>  > 
ND>  > ./configure --prefix=/ --enable-Werror=no

ND> Try --without-readline

Or add -ltermcap after -lreadline in Makefile

BTW: is anywhere diff to apply Reiser4 to plain 2.5.x (not bk tree) or I have to made this
manually (by hands)?


Best regards, Oleg O. Ossovitskii
software engineer, KGPA Ltd., Kaliningrad, West Russia
tel: +7(0112)46-23-40, fax: +7(0112)43-64-96
mailto:oleg@kgpa.ru, icq# 33366588

