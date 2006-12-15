From: Johannes Hirte <hirtejs@idmt.fraunhofer.de>
Subject: Re: deadlock produced by reiser4-patch
Date: Fri, 15 Dec 2006 12:53:24 +0100
Message-ID: <200612151253.24346.hirtejs@idmt.fraunhofer.de>
References: <200612142113.27072.hirtejs@idmt.fraunhofer.de> <4581C9C5.8020805@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30325-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4581C9C5.8020805@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com

Am Donnerstag, 14. Dezember 2006 23:01 schrieben Sie:

> Nup.
> This patch also contains changes which drop spin_lock/unlock(&inode_lock)
> in sync_inodes_sb()

You're right, this part is only missing on my system. Seems that something 
went horribly here, when patching the sources. Sorry for the false alert.
