From: "evilninja@gmx.net" <evilninja@gmx.net>
Subject: Re: how manage this? (was: Bug#304342: /sbin/mkreiserfs: created
 a filesystem with mkreiserfs -b 1024 ...)
Date: Thu, 28 Apr 2005 01:03:44 +0200
Message-ID: <42701A50.9090300@gmx.net>
References: <20050427144845.GA1727@raptus.dandreoli.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23932-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050427144845.GA1727@raptus.dandreoli.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Domenico Andreoli <cavok@tiscali.it>, Miernik <miernik@ffii.org>

Domenico Andreoli schrieb:
> hi,
> 
>   which advice i can give to those users finding these absurd and
> obviously buggy behaviours? thanks.

the OP should provide more details, to see if it is a debian-specific 
bug or (again with proper details) forward it upstream, e.g. to this list ;)

details could be syslog messages while accessing the fs, strace 
snippets, does other (debian)kernels show the same errors, does 
mkfs.reiserfs on other harddisks (or imagefiles) show the same 
behaviour, what do other "-b" arguments do....
