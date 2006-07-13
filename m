From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Wed, 12 Jul 2006 17:55:42 -0700
Message-ID: <20060712175542.108e6e37.akpm@osdl.org>
References: <44B52674.8060802@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751479AbWGMAzx@vger.kernel.org>
In-Reply-To: <44B52674.8060802@suse.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Wed, 12 Jul 2006 12:42:28 -0400
Jeff Mahoney <jeffm@suse.com> wrote:

>  On systems with block devices containing slashes (virtual dasd, cciss,
>  etc), reiserfs will fail to initialize /proc/fs/reiserfs/<dev> due to
>  it being interpreted as a subdirectory. The generic block device code
>  changes the / to ! for use in the sysfs tree. This patch uses that
>  convention.

Isn't it a bit dumb of us to be putting slashes in the device names anyway?
 It would be better, if poss, to alter dasd/cciss/etc and stop all these
s@/@!@everywhere games.
