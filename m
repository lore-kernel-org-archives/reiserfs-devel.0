From: Oleg Drokin <green@namesys.com>
Subject: Re: clm-6005
Date: Mon, 15 Apr 2002 17:23:01 +0400
Message-ID: <20020415172301.A23706@namesys.com>
References: <20020415013629.GA13011@nikolas.hn.org> <20020415092354.B1116@namesys.com> <1018876560.28340.165.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10068-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1018876560.28340.165.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Nick Orlov <nick.orlov@mail.ru>, reiserfs-list@namesys.com

Hello!

On Mon, Apr 15, 2002 at 09:16:00AM -0400, Chris Mason wrote:

> Lets start by finding out what files those inode numbers correspond to. 
> Could you please do a find /usr -inum 82746 (and for each of the other
> inodes numbers listed), then do an ls -la on that file and send us the
> output?

Nikita made a hint that pipes, sockets and device nodes can still cause such
behaviour on RO fs (or is it already delat with?).
Though I do not think /usr contains any pipes/sockets/device nodes ;)

Bye,
    Oleg
