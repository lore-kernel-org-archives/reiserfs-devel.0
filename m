From: Oleg Drokin <green@namesys.com>
Subject: Re: 2.5.9 kreiserfsd and sync hung in D state
Date: Tue, 23 Apr 2002 15:39:15 +0400
Message-ID: <20020423153915.A883@namesys.com>
References: <20020423073327.A21535@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020423073327.A21535@rushmore>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rwhron@earthlink.net
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Apr 23, 2002 at 07:33:27AM -0400, rwhron@earthlink.net wrote:

> Uninteruptable sleep created by:
> mkreiserfs /dev/sdc2
> mount -t reiserfs -o defaults,noatime /dev/sdc2 /fs2
> cpio -pdm filenames |  /fs2

Sorry? You mean you piped cpio output into mountpoint? And it worked?

> sync			# this is what has hung

Can you see where it hung? (alt-sysrq-T, if you have sysrq enabled).

> I would like to get reiserfs on 2.5.9 working on this machine.
> Any suggestions appreciated.

I am going to try reproducing.

Bye,
    Oleg
