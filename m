From: Ookhoi <ookhoi@humilis.net>
Subject: Re: [PATCH] new data logging and quota patches available
Date: Tue, 25 Feb 2003 16:31:20 +0100
Message-ID: <20030225163120.I807@humilis>
References: <1045870331.16048.325.camel@tiny.suse.com> <20030222165406.A862@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12914-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030222165406.A862@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

Hi Chris and Oleg,

Oleg Drokin wrote (ao):
> On Fri, Feb 21, 2003 at 06:32:11PM -0500, Chris Mason wrote:
> 
> > ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21 will soon be
> > updated with a new set of data logging and quota patches against
> > 2.4.21-pre4

[cut]

> Replacement 05-data-logging-36.diff.gz file that applies to
> 2.4.21-pre4-ac5 is available at
> ftp://namesys.com/pub/reiserfs-for-2.4/testing/05-data-logging-36-ac5.diff.gz
> It compiles, boots, survives my (simple) testing. (writing this email
> from patched 2.4.21-pre4-ac5, too). Quota works. symlinks are now have
> correct blocks count too

Light testing on 2.4.21-pre4-ac6 with the following patches is 100%
succesful:

(patch-2.4.21-pre4)
(patch-2.4.21-pre4-ac6)
03-relocation-6.diff 
04-reiserfs-sync_fs-1.diff 
05-data-logging-36-ac5.diff 
06-logging-export.diff 
08-reiserfs-quota-26.diff
09-kinoded-8.diff
10-reiserfs-quota-link-fix.diff

They apply with zero rejects.

Thanks a lot!!

If you have specific things you want to have tested, please let me know.
Quota is a It Works For Me(tm), but only very light testing.
