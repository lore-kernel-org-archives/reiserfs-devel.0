From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Reiser4 crypto-compression design
Date: Thu, 27 Mar 2003 18:34:09 -0500
Message-ID: <200303271834.10619.phma@webjockey.net>
References: <3E80B384.2190B074@namesys.com> <200303261916.37039.phma@webjockey.net> <3E832713.6050004@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13408-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E832713.6050004@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 27 March 2003 11:30, Hans Reiser wrote:
> Pierre Abbat wrote:
> >The way that's done in CFS is that the filenames are stored as regular
> >directory entries, but the names are encrypted. Anyone with permission can
> >list the contents, but without knowing the key he gets gibberish. The
> > names are stored in hex; we could also use base64 or base85, or come up
> > with a cipher that avoids producing nulls and slashes.
>
> I'll take a patch;-)

I don't know enough about ReiserFS internal to write one, nor do I have a 
machine running Reiser4 to try it on.

Here's how to make a cipher that avoids producing nulls and slashes:
Break the filename into 8-byte blocks (assuming 8 bytes in an encryption 
block). The last block is invalid if a null is followed by a nonnull or a 
slash occurs anywhere; all other blocks are invalid if a null or a slash 
occurs anywhere. Encrypt each block. If a block is invalid, encrypt it again 
until it is valid. This requires ECB mode; since this is the weakest mode, 
the key should be different for each block, perhaps by adding the tree key 
and the block number. This rules out Blowfish, which takes too long to set up 
the key.

phma
-- 
.i toljundi do .ibabo mi'afra tu'a do
.ibabo damba do .ibabo do jinga
.icu'u la ma'atman.
