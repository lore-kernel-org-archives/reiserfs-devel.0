From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Fw: Re: PROBLEM: ReiserFS: cannot remove file as root with 2.6.0test9-mm3
Date: Tue, 18 Nov 2003 18:18:42 +0300
Message-ID: <16314.14418.934805.874620@laputa.namesys.com>
References: <20031117125223.46d784be.akpm@osdl.org>
	<200311181403.52350.pizzaboy@web.de>
	<16314.7583.703758.67777@laputa.namesys.com>
	<200311181600.53888.pizzaboy@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16118-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200311181600.53888.pizzaboy@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingmar Sittl <pizzaboy@web.de>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>, Andrew Morton <akpm@osdl.org>

Ingmar Sittl writes:

[...]

 > >
 > > Eh? You mean you can remove file when compiled without
 > > CONFIG_REISERFS_CHECK and fail when compiled with checks on?
 > >
 > 
 > No, I wanted to say that I tried it with -mm3 first without and then with 
 > CONFIG_REISERFS_CHECK and it did not work both times.

So what does `same result' result means for 2.4.21?

Also, are there any kernel messages, when kernel is compiled with
CONFIG_REISERFS_CHECK?

 > 
 > Ingmar
 > 

Nikita.
