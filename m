From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: corruption?  how do I fix?
Date: Wed, 13 Nov 2002 19:13:59 -0500
Message-ID: <200211131913.59486.tomlins@cam.org>
References: <3DD1DEEF.6030903@panix.com> <3DD26C61.6000103@panix.com> <002d01c28b5d$7e5f7640$bf7b55c2@figwam>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11988-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <002d01c28b5d$7e5f7640$bf7b55c2@figwam>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, kenny gorman <kgorman@panix.com>, reiserfs-list@namesys.com

On November 13, 2002 04:41 pm, Vitaly Fertman wrote:
> Hi,
>
> > >> I am running a semi-large oracle database on reiserfs and lvm.  I
> > >> started receiving block corruption messages in oracle.  So I started
>
> Do you mean I/O error messages? reiserfsck does not check partitions
> for badblocks so I would suggest you to run /sbin/badblocks utility first.
> If you have badblocks on your device, it is a bad idea to continue using
> your harddrive, you probably should get a working one.

Vitaly, Bad blocks on an oracle db do not (necessarily) imply io errors.  In 
this case there is fs corruption as reported by reiserfsck 3.6.4.

Kenny, if I were you I would make sure I have a backup and logs and they
run with fix-fixable - reiserfsck has worked well here.

Ed Tomlinsons
