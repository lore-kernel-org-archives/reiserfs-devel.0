From: "Yura Umanets" <umanets@priocom.com>
Subject: Re: About Widman's crash
Date: Fri, 26 Apr 2002 14:15:30 +0300
Message-ID: <3CC936D2.8040701@priocom.com>
References: <3CC851EE.1030209@priocom.com> <3CC85108.4010504@namesys.com> <20020426090430.A11240@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10182-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Green <green@namesys.com>

Hello!

I have tried to reproduce the problem. And this is what I got.

Command:
reiserfsck -S --rebuild-tree /dev/hdb1

As result lost+found created, but I couldn't create any subdirs or files.

Example, command touch /lost+found/some_dir didn't return any error, but 
some_entry entry was not created at all.

debugreiserfs has showed me, that lost+found's direntry containts just 
"." and ".." But leaf contains strange direntries for non-created some_dir.

Then I ran reiserfsck --check /dev/hdb1. It said sd_size of lost+found 
isn't valid. (found 240 but expected 48)

I ran reiserfsck --fix-fixable /dev/hdb1 and it said it fixed problem 
with sd_size, but problem with ghost direntries remains.

metadata:
http://reiserfs.linux.kiev.ua/debug/metadata.tar.bz2

kernel:
2.4.19-pre7

reiserfsprogs:
3.x.1c-pre2

