From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: immutability
Date: Mon, 31 May 2004 11:40:39 +0400
Message-ID: <1085989239.1198.44.camel@tribesman.namesys.com>
References: <20040529152153.GA20663%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18926-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040529152153.GA20663%alexy.khrabrov@setup.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexy Khrabrov <list+reiserfs@setup.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello

On Sat, 2004-05-29 at 19:21, Alexy Khrabrov wrote:
> About immutability...
> 
> Now I have to confess, I've deleted those two files while trying to
> make them immutable whith chattr.  I didn't realize it applies to
> ext2/3 filesystems, and lsattr did show ..-i-...  Seeing i, I did rm,
> and there they went.  On the good side, I know what to do now if I
> accidentally delete a file on Linux, which is no small feat -- for years,
> I just thought, forget it.  Unix approach to recovery was, and still is,
> "backup", and if you didn't, you're an idiot whose files are not worth
> recovery anyway.  :)  Undoing an rm on Linux is a deeply vindicating
> experience :).  I wonder what v4 offers in that area.  And even with
> the current routine, as can be easily seen, there could be automated
> assembly scripts.
> 
> So, just to confirm -- is there chattr or a similar way to make files
> immutable? 

reiserfs has mount option attrs (mount -o attrs). chattr and lsattr
starts to work then. You may have to run reiserfsck --clean-attributes
before using it, though

>  I use a RAID to store digital photographs, running LVM on
> top of it consisting of the RAID physical volume only, and reiserfs in
> the logical volume spanning the only volume group spanning the RAID.
> The idea was, I'll just get those logical extents I need in case I
> need a used part of it -- here I'd need help from reiserfs's bitmap,
> still have to figure that out, that's what my original "partial dd"
> question was about.  I'd like to make the files "write once" via some
> kind of automated process.  Is there any way simpler than remounting
> the thing read-only after each write from a CF card?

