From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Reiser4 DOS
Date: Sun, 2 May 2004 21:33:32 +0300
Message-ID: <20040502183332.GR29226@nysv.org>
References: <200405021539.05907.mbuesch@freenet.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18366-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200405021539.05907.mbuesch@freenet.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Buesch <mbuesch@freenet.de>
Cc: reiserfs-list@namesys.com

On Sun, May 02, 2004 at 03:38:47PM +0200, Michael Buesch wrote:
>
>#!/bin/sh
>mount -treiser4 /dev/hdX /mnt/reiser4
>cd /mnt/reiser4
>while `/bin/true`; do
>	cd metas
>done

Do I remember something of my own, or wasn't there some discussion about
this?

"Should meta files have meta files"

I'd say this is a bug, meta files seem like they shouldn't have meta
data, by definition.

Is this going away in the next snapshot?

What about the metas dir inheriting +x from it's parent DIRECTORY, and
not necessarily parent FILE?

-- 
mjt

