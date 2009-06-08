From: doiggl@velocitynet.com.au
Subject: Re: Build Log failure for Package reiser4-kmp
Date: Tue, 9 Jun 2009 00:16:53 +1000 (EST)
Message-ID: <19264.202.168.22.19.1244470613.squirrel@webmail.velocity.net.au>
References: <12161.202.168.22.19.1244439532.squirrel@webmail.velocity.net.au>
    <4A2CB7E3.80401@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4A2CB7E3.80401@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: doiggl@velocitynet.com.au, reiserfs-devel@vger.kernel.org

Thanks Jeff

Which repository should I look in for the newer reiser4-kmp-default-*
modules as both these show dates of 13-Feb-2009 for file
reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64.rpm which are the old
ones.

Details from:
http://download.opensuse.org/repositories/home:/jeff_mahoney/openSUSE_Factory/x86_64/
and
http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_Factory/x86_64/

Thanks
Glenn

Jeff wrote
> Hi Glenn -
> I've updated the reiser4-kmp package to build against 2.6.30-rc8.
> It requires an updated kernel as well. The changelog should contain:
> - -------------------------------------------------------------------
> Mon Jun  8 09:01:23 CEST 2009 - jeffm@suse.com
>
> - - patches.suse/reiser4-set_page_dirty_notag: mm: Add
>   set_page_dirty_notag() helper for reiser4.
>
> - -Jeff


