From: Oleg Drokin <green@namesys.com>
Subject: Re: Permission denied !? - will i ever update my system again ?
Date: Thu, 18 Jul 2002 11:25:30 +0400
Message-ID: <20020718112530.A5226@namesys.com>
References: <1026942850.826.13.camel@prototype>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11040-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1026942850.826.13.camel@prototype>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Moritz Angermann <moritz.angermann@gmx.net>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jul 17, 2002 at 11:54:10PM +0200, Moritz Angermann wrote:

> now after using reiserFS for a very long term without any problems
> i'm facing a totaly new one and i'm helpless.
> the problem is, while apt-get dist-upgrade, you all know this
> command,[or not]
> i get : 
> can't access ./usr/include/arpa/telnet.h (...): permission denied
> so i did ls -lah /usr/include/arpa/
> the result : ( as root )
> ---
> #>ls -lah /usr/include/arpa/
> ls: /usr/include/arpa/telnet.h: Permission denied
> ls: /usr/include/arpa/tftp.h: Permission denied

Hm. So you have duplicate oid issue most probably, reiserfsck --rebuild-tree
will cure that. Be sure to update to latest reiserfsprogs first.
You might want to backup any critical data just in case prior to that procedure.

Bye,
    Oleg
