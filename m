From: Oleg Drokin <green@namesys.com>
Subject: Re: versions
Date: Sun, 9 Jun 2002 23:11:20 +0400
Message-ID: <20020609231120.A8386@namesys.com>
References: <16230799146.20020609093240@redefine.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10700-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <16230799146.20020609093240@redefine.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin <coggy@redefine.org>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Jun 09, 2002 at 09:32:40AM -0700, Kevin wrote:
> is there any easy way to tell what version a particular partition is?
> im not sure if what shows up in dmesg after i mount is necessarily the
> right version?

If you enable CONFIG_REISERFS_PROC_INFO,
you can look up the version of ondisk fs in /proc/fs/reiserfs/<partition>/super

Bye,
    Oleg
