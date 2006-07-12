From: Eric Dumazet <dada1@cosmosbay.com>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Wed, 12 Jul 2006 18:57:45 +0200
Message-ID: <200607121857.45988.dada1@cosmosbay.com>
References: <44B52674.8060802@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28977-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44B52674.8060802@suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

On Wednesday 12 July 2006 18:42, Jeff Mahoney wrote:
>  On systems with block devices containing slashes (virtual dasd, cciss,
>  etc), reiserfs will fail to initialize /proc/fs/reiserfs/<dev> due to
>  it being interpreted as a subdirectory. The generic block device code
>  changes the / to ! for use in the sysfs tree. This patch uses that
>  convention.
>
>  Tested by making dm devices use dm/<number> rather than dm-<number>

Your patch handles at most one slash. But the description mentions 'slashes' 
(ie several slashes)

> +	if (s)
> +		*s = '!';

Maybe you need a loop

while (s) {
	*s = '!';
	s = strchr(s, '/');
}

Eric
