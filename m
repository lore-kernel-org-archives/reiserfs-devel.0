From: Oleg Drokin <green@namesys.com>
Subject: Re: Speedup patch for 2.4.19-pre6 in bitmap.c
Date: Wed, 10 Apr 2002 23:05:27 +0400
Message-ID: <20020410230527.B23934@namesys.com>
References: <20020410165508.D54344@off.aspic.com> <20020410190203.A22633@namesys.com> <20020410170919.G54344@off.aspic.com> <20020410191356.A22756@namesys.com> <20020410204848.N54344@off.aspic.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020410204848.N54344@off.aspic.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoulle <philippe.gramoulle@mmania.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello!

On Wed, Apr 10, 2002 at 08:48:48PM +0200, Philippe Gramoulle wrote:
 
> I'll send the missing test ( without speedup patch and without Highmem) later tonight.
> PS: i'll also redo some tests with 2.4.18 +NFS_ALL and try with UDP as well.

Ok. Can you also try to measure writing speed without NFS in between?
(like dd if=/dev/zero of=/localfs/file ...)
With and without speedup & highmem

Thank you.

Bye,
    Oleg
