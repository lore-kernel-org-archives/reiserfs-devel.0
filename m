From: Peter Klotz <peter.klotz@aon.at>
Subject: Re: reiser4progs 1.0.5 configure script and libaal 1.0.5
Date: Sun, 14 Aug 2005 09:20:46 +0200
Message-ID: <42FEF0CE.5090001@aon.at>
References: <1123947554.11989.ezmlm@namesys.com> <1123948023.17483.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25452-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1123948023.17483.6.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com, =?ISO-8859-1?Q?Vanuxem_Gr=E9gory?= <g.vanuxem@wanadoo.fr>

Hello

> The lastest reiser4progs (1.0.5) can't find libaal
> in configure script.
>
> More precisely it doesn't find libaal because of version problem
>  
>
Maybe it is a permission problem caused by SELinux. I had similar 
troubles myself. Disabling SELinux in /etc/selinux/config helped.

Take a look at /var/log/messages if there are any SELinux related 
access-denied messages. On my system it seemed that ldconfig was not 
able to generate symbolic links for libaal and therefore reiser4progs 
were not able to find the required libaal version.

Here are two mailing list entries dealing with ldconfig/SELinux problems:

http://lists.freshrpms.net/pipermail/freshrpms-list/2004-December/011960.html 

https://www.redhat.com/archives/fedora-test-list/2004-December/msg00275.html 


Best regards, Peter.

