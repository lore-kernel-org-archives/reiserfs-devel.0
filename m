From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Reiser4 crypto-compression design
Date: Wed, 26 Mar 2003 07:30:34 -0500
Message-ID: <200303260730.34330.phma@webjockey.net>
References: <3E80B384.2190B074@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13389-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E80B384.2190B074@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

On Tuesday 25 March 2003 14:52, Edward Shushkin wrote:
>   When user creates a crypto-file, the file system asks for a secret
> key and calculates its id (128-bit word) which supposed to be stored
> in file's stat-data on disk.
>   When user opens crypto-file, the file system asks for a secret key,
> checks (by the id) if it is valid, and places a pointer to the
> crypto-file info to the reiser4 specific part of inode. This info
> includes cpu key words created by special method of the crypto plugin
> by the valid secret key.

Can a directory be marked as encrypted, so that all new files in the directory 
will be encrypted with the same key? Can a process hold an encryption key, so 
that all its children automatically can read files encrypted with that key?

