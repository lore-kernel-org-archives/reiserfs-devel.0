From: PFC <lists@boutiquenumerique.com>
Subject: Re: Debian, ACLs and 2.6.8 Linux kernel?
Date: Mon, 01 Aug 2005 11:18:07 +0200
Message-ID: <op.sutn4hgzth1vuj@localhost>
References: <42EDE8CB.8050300@vandervlis.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25283-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42EDE8CB.8050300@vandervlis.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Paul van der Vlis <paul@vandervlis.nl>, reiserfs-list@namesys.com



> I am also wondering why the default in Debian is to use "notail" as a  
> boot-option. Is it a problem to remove this boot-option later?

	I think grub needs notail to be able to boot (last time I checked...)
	Also notail is less efficient at packing but faster, or so it seems from  
the benchmarks.
