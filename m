From: Oleg Drokin <green@namesys.com>
Subject: Re: Advangates (A file-based interface for mount)
Date: Thu, 10 Jul 2003 09:41:23 +0400
Message-ID: <20030710054123.GB17957@namesys.com>
References: <3F078EF1.6090908@mrs.umn.edu> <3F0C161B.6030707@namesys.com> <16140.7137.369855.682433@laputa.namesys.com> <877k6r8q7x.fsf@labatt.uhoreg.ca> <3F0C89FC.8060604@mrs.umn.edu> <20030710025545.GB1160@vestdata.no>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14859-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030710025545.GB1160@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ragnar Kj?rstad <reiserfs@ragnark.vestdata.no>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 10, 2003 at 04:55:45AM +0200, Ragnar Kj?rstad wrote:

> You would also need to avoid suid / sgid files and device-nodes - this
> could probably be done by enforcing nosuid and nodev mount-flags. (Is
> that enough? or are there filesystems that have suid-support but don't
> support the nosuid flag?)

The nosuid/nodev/noexec/... stuff is enforced by VFS, not by individual filesystems.

Bye,
    Oleg
