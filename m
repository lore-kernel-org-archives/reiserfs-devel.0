From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiserfs cleanup patchset
Date: Thu, 05 Feb 2015 08:54:23 -0500
Message-ID: <54D3760F.3020700@suse.com>
References: <8c0c2a800dee38ccbf2849fd6e9c37aa@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <8c0c2a800dee38ccbf2849fd6e9c37aa@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 2/5/15 4:54 AM, doiggl@velocitynet.com.au wrote:
> Hello Jeff, Is there a .patch file available which covers the 1 to
> 29 reiserfs patchset

No.

> -Does it apply to 
> https://build.opensuse.org/package/show/openSUSE:Factory/reiserfs
> or upstream code ?

Neither.

This patch set is against the kernel and was accepted upstream quite a
while ago.

- -Jeff

> Just asking. I use reiserfs on a partition. No problems encountered
> with 3.6.24-x
> 
> Other details: # rpm -qa |grep -i reiserfs |sort 
> libreiserfs-0_3-0-0.3.0.5-164.1.2.x86_64 
> libreiserfscore0-3.6.24-2.2.1.x86_64 reiserfs-3.6.24-2.2.1.x86_64
> 
> debugreiserfs-fix-use-after-free-while-closing-log 	1.18 KB 
> reiserfs.changes 	16.3 KB reiserfs.spec 	2.96 KB 
> reiserfsprogs-3.6.24-22-g57eac84.tar.bz2 	221 KB silent-rules.patch
> 845 Bytes
> 
> --Glenn
> 
> from http://www.spinics.net/lists/reiserfs-devel/msg03814.html
> 
> Hi all -
> 
> I've had this patchset kicking around for a while. After a 
> conversation this past week about code that was horrible to read 
> (using reiserfs's balance_leaf as the primary example) and seeing 
> that Dave Jones had scratched a bit of an itch, I decided it was
> time to resync and push it out so I don't have to update it
> forever.
> 
> BTW, as I'm basically the only person with substantial patches
> against reiserfs, I'm 100% ok with disrupting context to this
> extent. :)
> 
> This set consists of 29 patches in a few areas.
> 
> 1 - Convert the commit workqueue to a per-fs workqueue 2 - Clean up
> ugly accessor macros to use more readable names 3 - Clean up
> comments to use the normal kernel style 4 - Remove the unused
> nblocks argument from journal_end 5 - Remove superblock argument
> from journal_end (it's in the trans handle) 6 - Remove superblock
> argument from journal_mark_dirty (see #5) 7 - Remove blocks
> argument from journal_join (it's always 1) 8 - Remove leading
> whitespace from labels 9 - Remove unnecessary parents 10 - Clean up
> dirent creation 11 - Clean up hash detection 12-29 - Clean up
> balance_leaf - This 2500-line function goes through 6 easily
> distinguishable stages, each with several sub-parts. The patch set
> splits up the stages and then reformats them to keep the split as
> obvious as possible. The final result is a whole lot easier to
> follow and easier on the eyes.
> 
> -Jeff
> 
> 


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJU03YPAAoJEB57S2MheeWyp44P/jg3AknZkTEOlOg1uuxcxJct
K2vKAz7kieHvmqI3hV6YdLoH/BxoneVRYYzZ7ejzFV0N7vJtIQzkkNjN0KW1hVSJ
utgjW6g/F5JLRWPl68/vkz5JSlVFNXuDJyBp5I7Rs3U+BbLFVU7oudJAybPMSJgB
QFoQUiMhjEU59jwnBg64B0nnmkW9vkybd+kM7f5Wy7ufdXLNYdZGvxAhM8ESm46r
iQ4ON/9Tk+k+2D98CSCVZR9e6n1eoJ15YLBlOS6sHxe3tzU3dZarDXwemF9iaTpA
BqVsr20YE4sPgV/6UcqPeEA/zxjTXzu99DIx0bsLJoy7PsGlTSg6GGLKe6j2A5XW
m9Oy1ezZ5DVcaYaWIvngt2f9Ca/i82VRkIJuWtWpMtYiRAHtKd9AABNTCrvMYmiJ
sQtm5fZlH6QlhdPfjvJWY3ntYecbIFodxYb5Y+xLRVXo5fVtnT/y5y0ggRhAj99i
7jWwCtR9nRaNRHz/hxfe7IU1Jrs3LY+qpCqALqNEIAtaJfu1pMfxgpXa0STIkiHq
wxy8ePxcBrPc/LFhZAiDseLJjwwDs74Pjv6WtmCWrxFlfS/unu01waWo4bLt5xko
NL6w62jITF266nhS/rrAzMw/+yVAiGeZSOVptTs9g3ATSwqjIiqnEzBpMLnsMdyl
oL9sNuaV92o4TxRdiB8r
=MpZ7
-----END PGP SIGNATURE-----
