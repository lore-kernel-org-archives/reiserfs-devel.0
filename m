From: Nick Orlov <nick.orlov@mail.ru>
Subject: Re: clm-6005
Date: Mon, 15 Apr 2002 09:49:28 -0400
Message-ID: <20020415134928.GA16140@nikolas.hn.org>
References: <20020415013629.GA13011@nikolas.hn.org>
 <20020415092354.B1116@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-10071-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020415092354.B1116@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hello,

below is a list files related for "strange" inodes:

find /usr -inum 18596
	/usr/lib/locale/ru_RU.koi8r/LC_MESSAGES/SYS_LC_MESSAGES
find /usr -inum 18595
	/usr/lib/locale/ru_RU.koi8r/LC_MONETARY
find /usr -inum 18594
	/usr/lib/locale/ru_RU.koi8r/LC_COLLATE
find /usr -inum 18593
	/usr/lib/locale/ru_RU.koi8r/LC_TIME
find /usr -inum 18592
	/usr/lib/locale/ru_RU.koi8r/LC_NUMERIC
find /usr -inum 18591
	/usr/lib/locale/ru_RU.koi8r/LC_CTYPE
find /usr -inum 47833
	/usr/local
find /usr -inum 275524
	/usr/bin/dpkg
find /usr -inum 275475
	/usr/share/locale/ru/LC_MESSAGES/dpkg.mo
find /usr -inum 82746
	/usr/lib/gconv/KOI8-R.so

As you can see - no pipes, no sockets, no device nodes.	

-- 
With best wishes,
	Nick Orlov.

