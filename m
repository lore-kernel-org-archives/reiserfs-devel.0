From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Performance improvements to key comparison functions
Date: Tue, 13 Jul 2004 00:07:05 +0300
Message-ID: <20040712210705.GZ4990@nysv.org>
References: <16626.61112.905268.684688@laputa.namesys.com> <20040712204952.C0C3A1617F@mail03.powweb.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19585-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040712204952.C0C3A1617F@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Dabbs <david@dabbs.net>
Cc: 'Nikita Danilov' <Nikita@Clusterfs.COM>, reiserfs-list@namesys.com

On Mon, Jul 12, 2004 at 03:49:25PM -0500, David Dabbs wrote:
>
>Is bonnie++ the recommended stress tool, or is there a reiser4 stress
>utility?

bonnie++ and slow.c are what one usually sees flying around.

fs stress or somesuch is also sometimes used, but it supposedly fragments
Reiser4 quite a bit and afaik there's no way to defrag yet?
Or does fsck do it, as I've gathered that some other variants do?

Anyway, if someone has something more cpu-intensive than bonnie++ to offer,
I'd also like to know about it, as bonnie++ uses a fair share of cpu
on my machine.

-- 
mjt

