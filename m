From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Reiser4 crypto-compression design
Date: Wed, 26 Mar 2003 19:16:37 -0500
Message-ID: <200303261916.37039.phma@webjockey.net>
References: <3E80B384.2190B074@namesys.com> <200303260730.34330.phma@webjockey.net> <87isu527di.fsf@labatt.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13402-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87isu527di.fsf@labatt.uhoreg.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 26 March 2003 15:35, Hubert Chan wrote:
> A related, but different question, which may have already been answered
> by Edward's document: can a directory be encrypted, so that only a user
> with the password can list its contents?

The way that's done in CFS is that the filenames are stored as regular 
directory entries, but the names are encrypted. Anyone with permission can 
list the contents, but without knowing the key he gets gibberish. The names 
are stored in hex; we could also use base64 or base85, or come up with a 
cipher that avoids producing nulls and slashes.

