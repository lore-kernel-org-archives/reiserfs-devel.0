From: Oleg Drokin <green@namesys.com>
Subject: Re: Red Hat Enterprise Linux AS (v. 2.1) and  > 2 GB files
Date: Thu, 26 Jun 2003 19:42:17 +0400
Message-ID: <20030626154217.GA14805@namesys.com>
References: <1056635615.1967.377.camel@atlas.vinterbro.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14715-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1056635615.1967.377.camel@atlas.vinterbro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Hagen <trond@vinterbro.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jun 26, 2003 at 03:53:35PM +0200, Trond Hagen wrote:

> I'm have problems with creating files bigger than 2GB on a 3.6 reiserfs.
> Why ?
> Spec:
> 2.4.9-e.24enterprise
> ReiserFS version 3.6.25 [as module]

You need to make sure that your filesystem is of 3.6 format (if it is not,
a warning is printed that 3.5.x format is used).

Bye,
    Oleg
