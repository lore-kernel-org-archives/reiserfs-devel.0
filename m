From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] reiserfs: Force type conversion in xattr_hash
Date: Tue, 23 Apr 2019 16:16:14 +0100
Message-ID: <20190423151614.GN2217@ZenIV.linux.org.uk>
References: <20190417115200.GA10168@bharath12345-Inspiron-5559>
 <20190418155019.ab5189e4e317df2b36861012@linux-foundation.org>
 <20190421170235.GI2217@ZenIV.linux.org.uk>
 <20190423145237.GA3609@bharath12345-Inspiron-5559>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190423145237.GA3609@bharath12345-Inspiron-5559>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bharath Vedartham <linux.bhar@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, jannh@google.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 23, 2019 at 08:22:37PM +0530, Bharath Vedartham wrote:

> > ISTR some discussions of reiserfs layout endianness problems, but
> > that had been many years ago and I could be wrong; I _think_
> > the conclusion had been "it sucks, but we can't do anything
> > without breaking existing filesystem images".  Not sure if that
> > was the same bug or something different, though.
> 
> Hi Al,
> 
> Thanks for your detailed explanation. I learnt quite a bit from it. 
> I agree we should not "supress" this bug.
> 
> I have noticed in the reiserfs code that, a checksum mismatch only
> causes a warning? Even if there is a checksum mismatch, data still is
> copied to the buffer? 
> 
> What is the point of the checksum over here? 

                reiserfs_warning(inode->i_sb, "jdm-20002",
                                 "Invalid hash for xattr (%s) associated "
                                 "with %k", name, INODE_PKEY(inode));
                err = -EIO;
IOW, reiserfs_xattr_get() fails on mismatch, not just whines into log.
