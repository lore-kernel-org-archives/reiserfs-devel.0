From: Hans Reiser <reiser@namesys.com>
Subject: Re: rebuild-tree
Date: Mon, 08 Dec 2003 18:51:29 +0300
Message-ID: <3FD49E01.9090502@namesys.com>
References: <1070829963.2789.528.camel@larry>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16289-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070829963.2789.528.camel@larry>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Larry Weldon <larry@welcoin.com>
Cc: reiserfs mailing list <reiserfs-list@namesys.com>

Larry Weldon wrote:

>A client's production file server is set up using RAID-1 with 2 IDE
>disks and reiserfs. The operating system is Mandrake 9.1.
>
which kernel does it use?

>=======================================================================
>Unfortunately, the tree structure used is also the weak point of 
>ReiserFS: if any of it gets corrupted, chances are that much more data
>will be affected than under traditional FileSystems. Rather than losing
>a single file to corruption of an inode, you may lose almost the entire
>contents of your disk if metadata close to the root of the BTree is
>affected. Fortunately, the likelihood of this happening due to bugs has
>been dramatically reduced in more recent version of the driver. Hardware
>failure caused corruption is still a serious problem, though.
>========================================================================
>  
>
The guy who wrote this does a nice job of telling one everything about 
himself except his email address.

I don't know why he says this, and I don't think it is true.  If you 
trash the blocks with the root directory in any filesystem you are going 
to end up with a lot of files in lost+found, yes?

Maybe others have a different experience or understanding of the remark.

With reiserfs, if you corrupt the internal nodes of the tree, you have 
to run fsck before you can use it, and in this we are more fragile, but 
once fsck has been run it is no more fragile than anything else 
(assuming you use the latest fsck, because fsck took a long time to 
stabilize).

>Now, I can't just stop using reiserfs and I don't want to. I think there
>is great merit in it. So, first, with the limited info I have given,
>what might have happened to create the problem and how likely might it
>be to happen again? Secondly, what is the *real* hazard of corruption
>_higher_up_ in the tree which the article says might blow away the whole
>partition?
>
>Thanks and regards.
>  
>


-- 
Hans


