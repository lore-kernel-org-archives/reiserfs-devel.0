From: Oleg Drokin <green@namesys.com>
Subject: Re: How to access data
Date: Tue, 26 Aug 2003 12:20:58 +0400
Message-ID: <20030826082057.GB5816@namesys.com>
References: <20030826003105.A60BCC6CA@mail.pilas.biz>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15413-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030826003105.A60BCC6CA@mail.pilas.biz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodolfo Pilas <rodolfo@pilas.biz>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Aug 25, 2003 at 09:31:05PM -0300, Rodolfo Pilas wrote:

> My notebook has batery problems and its lost power.  After a power down
> the HD remains with read block problems, with demage the filesystem.   I
> have not found how to mark bad block, for this reason I try to
> rebuild-tree to move data from bad block to another good place.

Chances are if you will write to that block, it will be fixed. This is
known (mis)feature of some IDE drives (mostly by IBM, I think) out there.

Bye,
    Oleg
